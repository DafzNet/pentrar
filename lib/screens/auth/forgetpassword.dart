// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/screens/auth/forgotpassword2.dart';
import 'package:pentrar/utils/text_styles.dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/loading_indicator.dart';
import 'package:pentrar/widgets/text_field.dart';

import '../../https/services.dart';
import '../../utils/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  final emailController = TextEditingController();
  bool emailVal = false;
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
                    pattern:'email',
                    validated: (p){
                      setState((){
                        emailVal = p;
                      });
                    },

                  )
                  ),
                  
                SizedBox(
                  height: 80,
                ),
                
                DefaultButton(
                  label: 'Reset Password',
                  active: emailVal,

                  onTap: () async{
                    
                    setState(() {
                      loading = true;
                    });

                    ApiClient httpClient = ApiClient();
                    try {
                      var res = await httpClient.post(
                        'auth/forgot-password',
                        {
                          "email": emailController.text.trim()
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

                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: ForgotPassword2Screen(),
                            type: PageTransitionType.rightToLeft
                          )
                        );
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
                ///Display error message only if there is an error in the inputted email address
                
                  
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}