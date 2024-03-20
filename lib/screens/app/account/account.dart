import 'package:flutter/material.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Profile'),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 0.5
                  )
                ),
                child: Column(
                  children: [
                    AccountButton(
                      text: 'Personal Info',
        
                      onTap: (){
        
                      },
                    ),
        
                    AccountButton(
                      text: 'Business Info',
        
                      onTap: (){
                        
                      },
                    ),
        
                    AccountButton(
                      text: 'Notifications',
        
                      onTap: (){
                        
                      },
                    ),
        
                    AccountButton(
                      text: 'Privacy Policies',
        
                      onTap: (){
                        
                      },
                    ),
        
                    AccountButton(
                      text: 'Contact Us',
        
                      onTap: (){
                        
                      },
                    ),
        
                    AccountButton(
                      text: 'Log out',
                      textColor: Colors.redAccent,
                      iconColor: Colors.redAccent,
                      showLine: false,
                      trailText: 'Version 1.01',
        
                      onTap: (){
                        
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}