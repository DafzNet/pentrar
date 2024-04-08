import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/success.dart';

import '../../../../https/services.dart';
import '../../../../widgets/text_field.dart';

class BusinessInformation extends StatefulWidget {
  const BusinessInformation({super.key});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  User user = GetIt.instance<User>();
  ApiClient httpClient = ApiClient();
    
  final bizNameController = TextEditingController();
  final typeController = TextEditingController();
  final regController = TextEditingController();
  final tinController = TextEditingController();
  final addressController = TextEditingController();

  void getVerStats()async{
    var res = await httpClient.get('farmer/${user.id}/individual-farmer', token: user.token);

    Map<String, dynamic>  data = json.decode(res);

    print(data);
    if (data['data']['category_type'] == 'individual'){
      bizNameController.text = data['data']['farm_name'];
      typeController.text = data['data']['category_type'];
      regController.text = 'Nill';
      tinController.text = 'Nill';
      addressController.text = data['data']['farm_location'];
    }else{
      bizNameController.text = data['data']['coy_name'];
      typeController.text = data['data']['category_type'];
      regController.text = 'Nill';
      tinController.text = 'Nill';
      addressController.text = data['data']['coy_address'];
    }
  }

  @override
  initState(){
    getVerStats();
    if (user.role.toLowerCase() == 'individual') {
      
    } else {
      
    }
    super.initState();
  }
  

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
                controller: typeController,
                enabled: false,
                
                
              ),


              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Business Name',
                controller: bizNameController,
                enabled: false,
              ),

              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Registration Number',
                controller: regController,
                enabled: false,
                
              ),


              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'TIN Number',
                controller:  tinController,
                enabled: false,
              ),


              SizedBox(height: 15,),

              SingleLineField(
                '',
                headerText: 'Address',
                enabled: false,
                controller: addressController,
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