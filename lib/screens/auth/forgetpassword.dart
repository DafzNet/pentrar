// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pentrar/utils/text_styles.dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/loading_indicator.dart';
import 'package:pentrar/widgets/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  final emailController = TextEditingController();
  bool showWrongEmailError = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LoadingIndicator(
            loading: loading,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                  
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text('Reset Password',
                    style: headerStyle,
                    ),
                  ],
                ),
                  
                  
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Text('Provide your email address below and we’ll send you instructions on how to reset your password.',
                      style: bodyStyle,
                      ),
                    ),
                  ],
                ),
                  
                SizedBox(
                  height: 50,
                ),
                  
                Center(
                  child: SingleLineField(
                    'Email Address',
                    controller: emailController,
                    )
                  ),
                  
                SizedBox(
                  height: 80,
                ),
                  
                  
                DefaultButton(
                  label: 'Reset Password',
                  
                  ),
          
          
                SizedBox(
                  height: 40,
                ),
          
          
                if(showWrongEmailError)...
                ///Display error message only if there is an error in the inputted email address
                [Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xffFEF2F2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'We could not find an account associated with the email address you provided.',
                        style: bodyStyle,
                      ),
          
          
                      Text(
                        'Please ensure that you have entered the correct email address or try using a different email address. If you continue to experience issues, please contact our customer support team for further assistance.'
                      )
          
          
                    ],
                  ),
                )
                ]
                  
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}