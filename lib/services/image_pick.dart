import 'dart:io';

import 'package:image_picker/image_picker.dart';


Future<File?> pickedImage({bool gallery = true}) async{
  try {
    if(gallery){
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final imageTemp = image!.path;

      return File(imageTemp);

    }else{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      final imageTemp = image!.path;

      return File(imageTemp);
    }

  }catch(e){
    return null;
  }
}