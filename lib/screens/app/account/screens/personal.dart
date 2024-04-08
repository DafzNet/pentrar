import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/text_field.dart';

import '../../../../utils/sizes..dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  User user = GetIt.instance<User>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final sexController = TextEditingController();

  @override
  void initState() {
    fullNameController.text = user.fullName;
    emailController.text = user.email;
    phoneController.text = user.phoneNumber;
    sexController.text = user.gender;
    print(user.phoneNumber);
    super.initState();
  }

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
                controller: fullNameController,
              ),


              SizedBox(height: 20,),

              SingleLineField(
                '',
                headerText: 'Email Address',
                controller: emailController,
                pattern: 'email',
              ),

              SizedBox(height: 20,),

              SingleLineField(
                '',
                headerText: 'Phone Number',
                pattern: 'number',
                keyboardType: TextInputType.number,
                controller: phoneController,

              ),


              SizedBox(height: 20,),

              SingleLineField(
                'Select',
                headerText: 'Gender',
                makeButton: true,
                controller: sexController,

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