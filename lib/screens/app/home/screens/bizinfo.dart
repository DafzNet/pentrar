// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/loading_indicator.dart';
import 'package:pentrar/widgets/success.dart';

import '../../../../widgets/text_field.dart';

class BusinessInfo extends StatefulWidget {

  final String bizType;


  const BusinessInfo({
    required this.bizType,
    super.key});

  @override
  State<BusinessInfo> createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {


    List<String> states = [
  'Abia',
  'Adamawa',
  'Akwa Ibom',
  'Anambra',
  'Bauchi',
  'Bayelsa',
  'Benue',
  'Borno',
  'Cross River',
  'Delta',
  'Ebonyi',
  'Edo',
  'Ekiti',
  'Enugu',
  'Gombe',
  'Imo',
  'Jigawa',
  'Kaduna',
  'Kano',
  'Katsina',
  'Kebbi',
  'Kogi',
  'Kwara',
  'Lagos',
  'Nasarawa',
  'Niger',
  'Ogun',
  'Ondo',
  'Osun',
  'Oyo',
  'Plateau',
  'Rivers',
  'Sokoto',
  'Taraba',
  'Yobe',
  'Zamfara',
];


  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final scaleController = TextEditingController();
  final ownershipController = TextEditingController();


  final regnumberController = TextEditingController();
  final tinController = TextEditingController();
  final yearController = TextEditingController();


  bool nameVal = false;
  bool addressVal = false;
  bool stateVal = false;
  bool scaleVal = false;
  bool ownersVal = false;
  bool yearVal = false;

  bool regVal = false;
  bool tinVal = false;

  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Business Information'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
          child: LoadingIndicator(
            loading: _loading,
            child: Column(
              children: [
                Container(
                  child: widget.bizType == 'individual'? Column(
                    children: [
                      SizedBox(height: 15,),
                
                      SingleLineField(
                        '',
                        headerText: 'Farm Name',
                        controller: nameController,
                        validated: (p0) {
                          setState(() {
                            nameVal = p0;
                          });
                        },
                      ),
                
                      SizedBox(height: 15,),
                
                
                      SingleLineField(
                        '',
                        headerText: 'Farm Address',
                        controller: addressController,
                        minLines: 4,
                        maxLines: 5,
            
                        validated: (p0) {
                          setState(() {
                            addressVal = p0;
                          });
                        },
                      ),
                
                
                      
                      SizedBox(height: 20),
                
                
                      SingleLineField(
                        'select',
                        headerText: 'Farm State',
                        makeButton:  true,
                        controller: stateController,
                
                        onTap: ()async{
                          await showModalBottomSheet(
                            backgroundColor: Color.fromARGB(73, 36, 15, 15),
                            context: context, 
                            builder: (BuildContext context){
                              return Container(
                                padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
                                
                
                                height: MediaQuery.of(context).size.height/1.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    20
                                  )
                                ),
                
                
                                child: ListView.builder(
                                  itemCount: states.length,
                                  itemBuilder: (context, index){
                                    return ListTile(
                                      title: Text(
                                        states[index]
                                      ),
                
                                      trailing: Icon(
                                        stateController.text == states[index]? MdiIcons.circle : MdiIcons.circleOutline
                                      ),
                
                                      onTap: (){
                                        stateController.text = states[index];
                                        setState(() {
                                          
                                        });
                
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          );
                        },
                      ),
                
                      SizedBox(height: 20,),
                
                
                      SingleLineField(
                        'select',
                        headerText: 'Land Ownership',
                        makeButton: true,
                        controller: ownershipController,
                        // suffixIcon: MdiIcons.,
                
                        onTap: ()async{
                          await showModalBottomSheet(
                            backgroundColor: Color.fromARGB(73, 36, 15, 15),
                            context: context, 
                            builder: (BuildContext context){
                              return Container(
                                padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
                                
                
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    20
                                  )
                                ),
                
                
                                child: ListView(
                                  children: [
                                    
                
                
                                    ListTile(
                                      title: Text('Owned'),
                                      trailing: Icon(
                                        ownershipController.text == 'Owned'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: ownershipController.text == 'Owned'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        ownershipController.text = 'Owned';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                                    ListTile(
                                      title: Text('Rented'),
                                      trailing: Icon(
                                        ownershipController.text == 'Rented'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: ownershipController.text == 'Rented'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        ownershipController.text = 'Rented';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                
                                    ListTile(
                                      title: Text('Leased'),
                                      trailing: Icon(
                                        ownershipController.text == 'Leased'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: ownershipController.text == 'Leased'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        ownershipController.text = 'Leased';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                                  ],
                                ),
                              );
                            }
                          );
                        },
                
                      ),
                
                
                
                      
                      SizedBox(height: 20,),
                
                
                      SingleLineField(
                        'select',
                        headerText: 'Farm Scale',
                        makeButton: true,
                        controller: scaleController,
                        // suffixIcon: MdiIcons.,
                
                        onTap: ()async{
                          await showModalBottomSheet(
                            backgroundColor: Color.fromARGB(73, 36, 15, 15),
                            context: context, 
                            builder: (BuildContext context){
                              return Container(
                                padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
                                
                
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    20
                                  )
                                ),
                
                
                                child: ListView(
                                  children: [
                                    
                
                
                                    ListTile(
                                      title: Text('Small'),
                                      trailing: Icon(
                                        scaleController.text == 'Small'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: scaleController.text == 'Small'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        scaleController.text = 'Small';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                                    ListTile(
                                      title: Text('Medium'),
                                      trailing: Icon(
                                        scaleController.text == 'Medium'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: scaleController.text == 'Medium'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        scaleController.text = 'Medium';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                
                                    ListTile(
                                      title: Text('Large'),
                                      trailing: Icon(
                                        scaleController.text == 'Large'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: scaleController.text == 'Large'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        scaleController.text = 'Large';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                                  ],
                                ),
                              );
                            }
                          );
                        },
                
                      ),
                
                
                
                    ],
                  )
                  
                  
                  
                  
                  
                  :
                  
                
                
                  Column(
                    children: [
                      SizedBox(height: 15,),
                
                      SingleLineField(
                        '',
                        headerText: 'Business Name',
                        controller: nameController,
                        validated: (p) {
                          setState(() {
                            nameVal = p;
                          });
                        },
                      ),
                
                      SizedBox(height: 15,),
                
                      SingleLineField(
                        '',
                        headerText: 'Registration Number',
                         controller: regnumberController,
                         pattern: 'number',
                        validated: (p) {
                          setState(() {
                            regVal = p;
                          });
                        },
                      ),
                
                
                      SizedBox(height: 15,),
                
                      SingleLineField(
                        '',
                        headerText: 'Tax Identification Number (TIN)',
                
                        controller: tinController,
                
                        pattern: 'number',
                        validated: (p) {
                          setState(() {
                            tinVal = p;
                          });
                        },
                      ),
                
                
                      SizedBox(height: 15,),
                
                      SingleLineField(
                        '',
                        headerText: 'Address',
                        minLines: 4,
                        maxLines: 5,
                
                        validated: (p) {
                          setState(() {
                            addressVal = p;
                          });
                        },
                      ),
                
                
                      SizedBox(height: 20),
                
                
                      SingleLineField(
                        'select',
                        headerText: 'Business State',
                        makeButton:  true,
                        controller: stateController,
                
                        onTap: ()async{
                          await showModalBottomSheet(
                            backgroundColor: Color.fromARGB(73, 36, 15, 15),
                            context: context, 
                            builder: (BuildContext context){
                              return Container(
                                padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
                                
                
                                height: MediaQuery.of(context).size.height/1.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    20
                                  )
                                ),
                
                
                                child: ListView.builder(
                                  itemCount: states.length,
                                  itemBuilder: (context, index){
                                    return ListTile(
                                      title: Text(
                                        states[index]
                                      ),
                
                                      trailing: Icon(
                                        stateController.text == states[index]? MdiIcons.circle : MdiIcons.circleOutline
                                      ),
                
                                      onTap: (){
                                        stateController.text = states[index];
                                        setState(() {
                                          
                                        });
                
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          );
                        },
                      ),
                
                      SizedBox(height: 20,),
                
                      SingleLineField(
                        '',
                        headerText: 'Year of Establishment',
                        pattern: 'number',
                        controller: yearController,
                
                        validated: (p) {
                          setState(() {
                            yearVal = p;
                          });
                        },
                      ),
                
                      SizedBox(height: 20,),
                
                      
                
                      SingleLineField(
                        'select',
                        headerText: 'Business Scale',
                        makeButton: true,
                        controller: scaleController,
                        // suffixIcon: MdiIcons.,
                
                        onTap: ()async{
                          await showModalBottomSheet(
                            backgroundColor: Color.fromARGB(73, 36, 15, 15),
                            context: context, 
                            builder: (BuildContext context){
                              return Container(
                                padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
                                
                
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    20
                                  )
                                ),
                
                
                                child: ListView(
                                  children: [
                                    
                
                
                                    ListTile(
                                      title: Text('Small'),
                                      trailing: Icon(
                                        scaleController.text == 'Small'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: scaleController.text == 'Small'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        scaleController.text = 'Small';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                                    ListTile(
                                      title: Text('Medium'),
                                      trailing: Icon(
                                        scaleController.text == 'Medium'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: scaleController.text == 'Medium'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        scaleController.text = 'Medium';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                
                                    ListTile(
                                      title: Text('Large'),
                                      trailing: Icon(
                                        scaleController.text == 'Large'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                        color: scaleController.text == 'Large'?primaryColor:Colors.grey[800],
                                      ),
                                      onTap: () {
                                        scaleController.text = 'Large';
                                        setState(() {
                                          
                                        });
                                        Navigator.pop(context);
                                        
                                      },
                                    ),
                
                                  ],
                                ),
                              );
                            }
                          );
                        },
                
                      ),
                
                
                      
                    ],
                  ),
                ),
            
            
                SizedBox(height: 35,),
            
                DefaultButton(
                  label: 'Submit',
            
                  active: widget.bizType == 'individual'?
                    nameVal && addressVal && scaleController.text.isNotEmpty &&stateController.text.isNotEmpty && ownershipController.text.isNotEmpty
                  : nameVal && addressVal && scaleController.text.isNotEmpty &&stateController.text.isNotEmpty && regVal && tinVal && yearVal,
            
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
                ),
            
            
            
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}