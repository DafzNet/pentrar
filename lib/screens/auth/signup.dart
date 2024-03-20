// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, await_only_futures, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/screens/auth/login.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/text_styles.dart';
import 'package:pentrar/widgets/buttons.dart';

import '../../widgets/loading_indicator.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  ApiClient httpClient = ApiClient();

  

  bool cloading =false;

  int _currentIndex = 0;
  final _controller = PageController();



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        actions: [
          if(_currentIndex<=5)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '${_currentIndex + 1}/6',
          
              style: bodyStyle,
            ),
          )
        ],

        title: _currentIndex<=5? Wrap(
          spacing: 5,
          children: List.generate(6, (index) => Container(
            height: 4, width: 30,
            decoration: BoxDecoration(
              color: _currentIndex >= index? primaryColor:primaryColor.shade50,
              borderRadius: BorderRadius.circular(5)
            ),
          )
        ),
        ):Text(''),

      ),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LoadingIndicator(
            loading: cloading,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [

                SizedBox(
                  height: MediaQuery.sizeOf(context).height-300,
                  child: PageView(
                    controller: _controller,

                    onPageChanged: (p){
                      _currentIndex = p;

                      setState(() {
                        
                      });
                    },
                    children: [
                    ],
                  ),
                ),
                  
                  
                SizedBox(
                  height: 40,
                ),


                DefaultButton(
                  label: 'Next',
                  onTap: () {
                     _controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
                  },
                ),
                                      
                if(_currentIndex == 0)  
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      PageTransition(
                        child: LoginScreen(), 
                        type: PageTransitionType.rightToLeft
                        )
                      );

                    
                  },
            
                  child: Text(
                    'Already have an account? Sign in',
            
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
    );
  }
}