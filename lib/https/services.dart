// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';



const String baseUrl = "https://api-pentrar.vercel.app";

class ApiClient{
  ApiClient(

  );

  var client = Client();


Future<dynamic> get(
  String api,
  {
    Map<String, String>? headers,
    String? token,
    String? bUrl,
    Duration timeout = const Duration(seconds: 10),
  }
) async {
  var url = Uri.parse(bUrl ?? '$baseUrl/$api');

  try {
    final response = await client.get(
      url, 
      headers: token == null? headers:{
        "Authorization": 'Bearer $token',
        ...?headers
      }
    ).timeout(timeout);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the request was successful (2xx status code),
      // return the response body (which is of type String).
      return response.body;

    } else if (response.statusCode >= 300 && response.statusCode < 400) {
      throw ApiException('Client Error: ${response.statusCode}', uri: url);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw ApiException('Client Error: ${response.statusCode}', uri: url);
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      throw ApiException('Server Error: ${response.statusCode}', uri: url);
    } else {
      throw ApiException('Unexpected HTTP Status Code: ${response.statusCode}',
          uri: url);
    }
  } on TimeoutException {
    throw NetworkException('Request timed out');
  } on ApiException catch (e) {
    // Re-throw custom ApiException with additional context information.
    throw ApiException('${e.message} $url', uri: url);
  } catch (e) {
    throw NetworkException('Network Error: $e');
  }
}

  ////////post to server

Future<dynamic> post(
  String api,
  dynamic object,
  
  {
    Map<String, String>? headers,
    String? token,
    String? bUrl}
) async {
  var url = Uri.parse(bUrl ?? '$baseUrl/$api');

  try {
    final response = await client.post(
      url, 
      body: object, 
      headers: token == null? headers:{
        "Authorization": 'Bearer $token',
        ...?headers
      }
    );

    return response.body;
  } catch (e) {
    // Handle any other exceptions that might occur during the request.
    // You might want to log the error or perform additional error handling.
    rethrow; // Rethrow the exception to let the caller handle it.
  }
}

Future<dynamic> put(
  String api,
  dynamic object,
  {Map<String, String>? headers, String? bUrl}
) async {
  var url = Uri.parse(bUrl ?? '$baseUrl/$api');

  try {
    final response = await client.put(url, body: object, headers: headers);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the request was successful (2xx status code),
      // parse the response body if it's in JSON format.
      final responseBody = response.body;
      return responseBody;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      // If there's a client error (4xx status code),
      // you might want to handle it differently, e.g., show user-friendly error messages.
      throw ClientException('Client Error: ${response.statusCode}', url);
    } else {
      // For any other status codes, throw a general exception.
      throw Exception('Unexpected HTTP Status Code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any other exceptions that might occur during the request.
    // You might want to log the error or perform additional error handling.
    rethrow; // Rethrow the exception to let the caller handle it.
  }
}


Future<Map<String, dynamic>> multipartReqFromString(
  String api,
  {
    String type = 'POST',
    required String fileField,
    Map<String, String>? fields,
    Map<String, String>? headers,
    required String fileContent, // Use a string for file content
  }) async {
  var allowedFileTypes = ['.png', '.jpg', '.pdf', '.jpeg'];

  // Assuming 'fileContent' is the actual content of the file as a string
  var fileType = fileContent.split('.').last.toLowerCase();
  if (!allowedFileTypes.contains('.$fileType')) {
    return {
      'err': 'Invalid file type. Only ${allowedFileTypes.join(', ')} files are allowed.'
    };
  }

  var url = Uri.parse('$baseUrl/$api');

  try {
    var req = MultipartRequest(type, url);

    if (fields != null) {
      fields.forEach((key, value) {
        req.fields[key.toString()] = value.toString();
      });
    }

    if (headers != null) {
      headers.forEach((key, value) {
        req.headers[key.toString()] = value.toString();
      });
    }

    req.files.add(
      MultipartFile
      .fromString(
        fileField,
        fileContent,
        filename: 'file.${fileType}', // Provide a filename with the correct extension
      ),
    );

    final response = await req.send();

    if (response.statusCode == 400) {
      // Bad Request
      final errorResponse = await response.stream.bytesToString();
      print('Bad Request: $errorResponse');
      return json.decode(errorResponse);
    } else if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonResponse = await response.stream.bytesToString();
      return json.decode(jsonResponse);
    } else {
      // Handle other status codes if needed.
      print('Request failed with status code ${response.statusCode}');
      return {'err': 'Request failed with status code ${response.statusCode}'};
    }
  } catch (e) {
    print('Error sending multipart request: $e');
    return {'err': 'Error sending multipart request: $e'};
  }
}


MediaType getMediaType(String filePath) {
  final extension = filePath.split('.').last.toLowerCase();
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return MediaType('image', 'jpeg');
    case 'png':
      return MediaType('image', 'png');
    case 'gif':
      return MediaType('image', 'gif');
    // Add more cases for other image formats if needed
    default:
      // Default to 'application/octet-stream' for unknown types
      return MediaType('application', 'octet-stream');
  }
}


Future<Map<String, dynamic>> multipartReq(
  String api,
  {
    String type = 'POST',
    required String fileField,
    Map<String, String>? fields,
    Map<String, String>? headers,
    required File file,
  }) async {
  var url = Uri.parse('$baseUrl/$api'); // Form the complete URL using baseUrl and api.

  try {
    var req = MultipartRequest(type, url); // Create the multipart request.

    // Include fields in the upload, if provided.

    if (fields != null) {
      fields.forEach((key, value) {
        req.fields[key.toString()] = value.toString();
      });
    }
    

    // Include headers in the upload, if provided.
    if (headers != null) {
      headers.forEach((key, value) {
        req.headers[key.toString()] = value.toString();
      });
    }
    // Add the file to the request as a MultipartFile.
    req.files.add(
        MultipartFile
        .fromBytes(
        fileField, // This should be the field name for the file in the request.
        File(file.path).readAsBytesSync(),
        filename: file.path,
        contentType: getMediaType(file.path)
      ),
    );

    final response = await req.send(); // Send the request.
    final r = await response.stream.bytesToString();

    return json.decode(r);
    // Handle the response appropriately, for example, read the response and parse JSON.
    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   final jsonResponse = await response.stream.bytesToString();
    //   return json.decode(jsonResponse);
    // } else {
    //   // Handle non-200 status code if needed.
    //   print('Request failed with status code ${response.statusCode}');
    //   return {'err':'Request failed with status code ${response.statusCode}'}; // Return an empty Map or throw an exception, based on your needs.
    // }
  } catch (e) {
    // Handle exceptions and return an empty Map or throw an exception, based on your needs.
    print('Error sending multipart request: $e');
    return {'err':'Error sending multipart request: $e'}; // Return an empty Map or throw an exception, based on your needs.
  }
}

}


class ApiException implements Exception {
  final String message;
  final Uri? uri;

  ApiException(this.message, {this.uri});

  @override
  String toString() => "ApiException: $message";
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}
