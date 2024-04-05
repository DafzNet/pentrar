// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class NotificationSettings extends StatefulWidget {

  const NotificationSettings({

    super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {


  bool push = false;
  bool email = false;
  bool sms = false;


  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Notification'),
      ),


      body: Column(

        children: [

            SizedBox(
                height: 20,
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7), 
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email Notifications',
                      style:  Theme.of(context).textTheme.titleSmall,
                    ),
              
                    SizedBox(
                      child: Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                        value: email,
                        onChanged: (bool value) async{
                              setState(() {
                                email = value;
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7), 
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Push Notifications',
                      style:  Theme.of(context).textTheme.titleSmall,
                    ),
              
                    SizedBox(
                      child: Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: Colors.grey,
                        inactiveThumbColor: Colors.white,
                        value: push,
                        onChanged: (bool value) async{
                              setState(() {
                                push = value;
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),



              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7), 
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SMS Notifcations',
                      style:  Theme.of(context).textTheme.titleSmall,
                    ),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
              
                      children: [
                        Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          inactiveTrackColor: Colors.grey,
                          inactiveThumbColor: Colors.white,
                          value: sms,
                          onChanged: (bool value) async{
                            setState(() {
                                sms = value;
                              });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
      )
    );
  }
}