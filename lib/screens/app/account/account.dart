import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/screens/app/account/screens/notif.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';

import '../../../models/user.dart';
import 'screens/business.dart';
import 'screens/personal.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User user = GetIt.instance<User>();
  ApiClient httpClient = ApiClient();



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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,

                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  )
                ],
              ),

              SizedBox(height: 10,),

              Text(
                user.fullName,
                style:  Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),


              SizedBox(height: 5,),

              FutureBuilder(
                future: httpClient.get('farmer/${user.id}/individual-farmer', token: user.token),
                builder: (context, snapshot) {
                  if (snapshot.hasError || snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                    return Container();
                  }
                  print(snapshot.data);
                  Map<String, dynamic>  data = json.decode(snapshot.data);
                  return Text(
                    data['data']['category_type'] == 'individual'? data['data']['farm_name'].toString():data['data']['coy_name'].toString(),
                    style:  Theme.of(context).textTheme.titleSmall,
                  );
                }
              ),


              SizedBox(height: 20,),

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
                        Navigator.push(
                          context,
                          PageTransition(
                            child: PersonalInfo(),
                            type: PageTransitionType.fade
                          )
                        );
                      },
                    ),
        
                    AccountButton(
                      text: 'Business Info',
        
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            child: BusinessInformation(),
                            type: PageTransitionType.fade
                          )
                        );
                      },
                    ),
        
                    AccountButton(
                      text: 'Notifications',
        
                       onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            child: NotificationSettings(),
                            type: PageTransitionType.fade
                          )
                        );
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
        
                    
                  ],
                ),
              ),


              AccountButton(
                text: 'Log out',
                textColor: Colors.redAccent,
                iconColor: Colors.redAccent,
                showLine: false,
                trailText: 'Version 1.01',
                bgColor: Theme.of(context).scaffoldBackgroundColor,
  
                onTap: (){
                  
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}