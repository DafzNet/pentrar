// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, await_only_futures, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/screens/app/nav.dart';
import 'package:pentrar/screens/auth/forgetpassword.dart';
import 'package:pentrar/screens/auth/signup.dart';
import 'package:pentrar/utils/text_styles.dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/text_field.dart';
import '../../widgets/loading_indicator.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController(text: 'dafz.daniel@gmail.com');
  final passController = TextEditingController(text: 'FRvb7Ral0IRr');

  bool emailVal = false;
  bool passVal = false;

  ApiClient httpClient = ApiClient();

  

  bool cloading =false;

  Future _login()async{
    
    const String api = 'auth/login';

    final userData = await httpClient.post(
      api,
      {
        "email": emailController.text.toLowerCase().trim(),
        "password": passController.text
      }
    );

    print(userData);

    return userData;
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),

      body: LoadingIndicator(
        loading: cloading,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                          
                      Image.asset(
                        'assets/images/logo.png',
                      ),
                          
                      SizedBox(
                        height: 30,
                      ),
                        
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Expanded(
                            child: Text(
                              'Login to your account',
                              style: headerStyle,
                            ),
                          ),
                        ],
                      ),
                        
                        
                     
                        
                      SizedBox(
                        height: 30,
                      ),
                        
                      Center(
                        child: SingleLineField(
                            '',
                            headerText: 'Email address',
                            pattern: 'email',
                            controller: emailController,

              
                            validated: (p) {
                              setState(() {
                                emailVal = p;
                              });
                            },
                          )
                        ),
                      
                      SizedBox(height: 25,),
                      
                      SingleLineField(
                        '',
                        headerText: 'Password',
                        password: true,
                        maxLines: 1,
                        controller: passController,

                        pattern: 'password',

                        validated: (p) {
                          setState(() {
                            passVal = p;
                          });
                        },
            
                      ),
                        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: ForgotPasswordScreen(),
                                  type: PageTransitionType.rightToLeft
                                )
                              );
                            },
                            child: Text('Forget your password?',
                        
                            style: smallStyle
                            ),
                          ),
                        ],
                      ),
                        
                      SizedBox(
                        height: 20,
                      ),
                          
                          
                      DefaultButton(
                        label: 'Login',
                        active: emailVal && passVal,
                          
                        onTap: ()async{
                          //acefarmmarket@gmail.com
                          //Password123#

                          setState((){cloading = true;});
                          final data =  await _login();

                          Map<String, dynamic> _data = json.decode(data) as  Map<String,dynamic>;
                          print(_data);

                          if (_data['status'] == true) {
                            print(_data['message']);

                            Map<String, dynamic> decodedToken = JwtDecoder.decode(_data["data"]["accessToken"]);
                            
                            decodedToken['token']=_data["data"]["accessToken"];

                            print(decodedToken);
                            final user = User.fromJson(decodedToken);
                            GetIt.instance.registerSingleton<User>(user);
                            

                            Navigator.push(
                              context,
                              PageTransition(child: AppBaseNavigation(), type: PageTransitionType.fade)  
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(_data['message']))
                            );

                            setState((){cloading = false;});
                          }

                          

                          setState((){cloading = false;});
              
                          
                        },
                      ),
                                            
                        
                      TextButton(
                              onPressed: (){
                                // Navigator.push(
                                //   context,
                                //   PageTransition(
                                //     child: SignupScreen(), 
                                //     type: PageTransitionType.rightToLeft
                                //     )
                                //   );
                              },
                        
                              child: Text(
                                'Don’t have an account? Sign up',
                        
                                style: smallStyle
                              ),
                            ),  
              
                      SizedBox(
                        height: 35,
                      ),  
                        
                        
                    ],
                  ),
                ),
              ),
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    
                  },
        
                  child: Text(
                    'Terms & Conditions'
                  ),
                ),
        
                TextButton(
                  onPressed: () {
                    
                  },
        
                  child: Text(
                    'Privacy Policy'
                  ),
                ),
                
              ],
            ),
        
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '© 2024 Pentra. All right reserved.'
                  )
                
              ],
            ),
        
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}