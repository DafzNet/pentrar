import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/screens/auth/login.dart';
import 'package:pentrar/utils/colors.dart';




void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pentrar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
      primaryColor: Colors.white,
      primaryColorLight: Colors.black,
      primarySwatch: primaryColor,
      scaffoldBackgroundColor: Colors.grey[100],

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.manrope(color: Colors.black, fontSize: 16),
        bodyMedium: GoogleFonts.manrope(color: Colors.black, fontSize: 14),
        bodySmall: GoogleFonts.manrope(color: Colors.black, fontSize: 12),
        titleLarge: GoogleFonts.manrope(color: Colors.black, fontSize: 24),
        titleMedium: GoogleFonts.manrope(color: Colors.black, fontSize: 20),
        titleSmall:GoogleFonts.manrope(color: Colors.black, fontSize: 16),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        )
      ),

      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.tealAccent,
        textTheme: ButtonTextTheme.primary,
      ),
      ),

      home: LoginScreen()
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

