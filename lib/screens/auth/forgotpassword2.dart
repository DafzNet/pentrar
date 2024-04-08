// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/text_styles.dart';
import 'package:pentrar/widgets/loading_indicator.dart';

import '../../widgets/buttons.dart';
import '../../widgets/text_field.dart';

class ForgotPassword2Screen extends StatefulWidget {

  const ForgotPassword2Screen({

    super.key});

  @override
  State<ForgotPassword2Screen> createState() => _ForgotPassword2ScreenState();
}

class _ForgotPassword2ScreenState extends State<ForgotPassword2Screen> {


  final otpController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();

  bool codeVal = false;
  bool passVal = false;
  bool passConfirmVal = false;

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
                    'Enter OTP',
                    controller: otpController,
                    minLen: 4,
                    validated: (p){
                      setState((){
                        codeVal = p;
                      });
                    },

                  )
                  ),


                  SizedBox(
                  height: 20,
                ),
                  
              
              SingleLineField(
                    'Enter New Password',
                    controller: passController,
                    pattern: 'password',
                    validated: (p){
                      setState((){
                        passVal = p;
                      });
                    },

                  ),


                   SizedBox(
                  height: 20,
                ),
                  


                  SingleLineField(
                    'Confirm Password',
                    controller: passConfirmController,
                    pattern: 'password',
                    validated: (p){
                      setState((){
                        passConfirmVal = p;
                      });
                    },

                  ),
                SizedBox(
                  height: 80,
                ),
                
                DefaultButton(
                  label: 'Reset Password',
                  active: passConfirmVal && passVal && codeVal && passConfirmController.text == passController.text,

                  onTap: () async{
                    
                    setState(() {
                      loading = true;
                    });

                    ApiClient httpClient = ApiClient();
                    try {
                      var res = await httpClient.post(
                        'auth/reset-password',
                        {
                          "code": otpController.text.trim(),
                          "new_password": passController.text
                        }
                      );

                      Map<String, dynamic> data = json.decode(res);

                      if (data['status']) {
                       setState(() {
                          loading = false;
                        });
                      
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColor.shade600,
                            content: Text(
                            data['message'],
                          ))
                        );

                        Navigator.pop(context);
                      } else {
                         setState(() {
                          loading = false;
                        });
                      
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColor.shade600,
                            content: Text(
                            data['message'],
                          ))
                        );
                      }


                    } catch (e) {
                       setState(() {
                          loading = false;
                        });
                      
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColor.shade600,
                            content: Text(
                            'Oops, something went wrong, try again later',
                          ))
                        );
                    }
                    
                  },
                  
                  ),
          
          
                SizedBox(
                  height: 40,
                ),
                           
              ],
            ),
          ),
        ),
      ),
    );
  }
}