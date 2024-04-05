import 'package:flutter/material.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/success.dart';

import '../../../../widgets/text_field.dart';

class BusinessInformation extends StatefulWidget {
  const BusinessInformation({super.key});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Business Information'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Business Type',
                enabled: false,
                
                
              ),


              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Business Name',
                enabled: false,
              ),

              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Registration Number',
                enabled: false,
                
              ),


              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'TIN Number',
                enabled: false,
              ),


              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Address',
                enabled: false,
                minLines: 4,
                maxLines: 5,
              ),

              SizedBox(height: 35,),

              DefaultButton(
                label: 'Contact Support',

                onTap: (){
                  showModalBottomSheet(
                    context: context, 
                    builder: (context){
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        ),
                        
                        child: Success(
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ));
                    }
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}