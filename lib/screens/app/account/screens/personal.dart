import 'package:flutter/material.dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/text_field.dart';

import '../../../../utils/sizes..dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Personal Information'),
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),

              SingleLineField(
                '',
                headerText: 'Full Name',
              ),


              SizedBox(height: 20,),

              SingleLineField(
                '',
                headerText: 'Email Address',
              ),

              SizedBox(height: 20,),

              SingleLineField(
                '',
                headerText: 'Phone Number',
                keyboardType: TextInputType.number,
              ),


              SizedBox(height: 20,),

              SingleLineField(
                'Select',
                headerText: 'Gender',
                makeButton: true,

                onTap: (){

                },
              ),


              SizedBox(height: 50,),

              DefaultButton(
                label: 'Save'
              )
              
            ],
          ),
        ),
      ),
    );
  }
}