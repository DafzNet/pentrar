import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/loading_indicator.dart';
import 'package:pentrar/widgets/success.dart';
import 'package:pentrar/widgets/text_field.dart';

import '../../../../services/image_pick.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../widgets/buttons.dart';

class AddProduce extends StatefulWidget {
  const AddProduce({super.key});

  @override
  State<AddProduce> createState() => _AddProduceState();
}

class _AddProduceState extends State<AddProduce> {


  User user = GetIt.instance<User>();
  ApiClient httpClient = ApiClient();


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

  TextEditingController  nameController = TextEditingController();
  TextEditingController  desController = TextEditingController();
  TextEditingController  classController = TextEditingController();
  TextEditingController  addressController = TextEditingController();
  TextEditingController  dateharvestController = TextEditingController();
  TextEditingController  stateController = TextEditingController();
  TextEditingController  weatherController = TextEditingController();
  final quantityController = TextEditingController();
  final storageController = TextEditingController();

  final landmarkController = TextEditingController();
  final unitController = TextEditingController();

  final dateplantController = TextEditingController();
  File? img;

  final classes = ['Cereal', 'Fruit', 'Vegetable', 'Root', 'Leaf', 'Fibre', 'Other'];



  DateTime _selected = DateTime.now();
  DateTime _selectedHarvest = DateTime.now();

  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Add Produce'),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: LoadingIndicator(
            loading: _loading,
            child: Column(
              children: [
                SizedBox(height: 10,),
            
            
                Row(
                  children: [
                    Text(
                      'Add Image',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
            
                Row(
                  children: [
                    Text(
                      'You are allowed to upload 4 images and 1 video.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
            
            
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      child: InkWell(
                        onTap: ()async{
                          img = await pickedImage();
                      
                          setState(() {
                            
                          });
                        },
                        child: Image.asset(
                          camera
                        ),
                      ),
                    ),


                    Text(
                      img!=null?img!.path.split('/').last.toString():'',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
            
            
                
            
                SingleLineField(
                  'Enter product name',
                  headerText: 'Product Name',
                  controller: nameController,
                ),
            
            
                const SizedBox(height: 20),
            
            
                SingleLineField(
                  '',
                  headerText: 'Product Description',
                  maxLines: 10,
                  minLines: 5,
                  controller: desController,
            
                ),
            
            
                
                SizedBox(height: 20),
            
            
                SingleLineField(
                  'DD/MM/YYYY',
                  headerText: 'Planting Date',
                  makeButton: true,
                  suffixIcon: MdiIcons.calendarMonthOutline,
                  controller: dateplantController,
            
                  onTap: () async{
                        DateTime? date = await showDatePicker(
                          context: context, 
                          initialDate: new DateTime.now(), 
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime.now().add(Duration(days: 365)),
                    
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: primaryColor,
                                colorScheme: ColorScheme.light(
                                  primary: primaryColor, // Header text color
                                  onPrimary: Colors.white, // Header background text color
                                  surface: primaryColor.shade100,
                                  onSurface: Colors.black,
                                ),
                                buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Button text color
                              ),
                              child: child!,
                            );
                          },
                        );
                    
                        if (date != null) {
                          dateplantController.text = DateFormat('E d, MMM yyyy').format(date);
                          _selected = date;
                        } else {
                          dateplantController.text = DateFormat('E d, MMM yyyy').format(DateTime.now());
                          _selected = DateTime.now();
                        }
                    
                        setState(() {
                          
                        });
                      },
                )       ,
            
            
                
                SizedBox(height: 20),
            
            
                SingleLineField(
                  'select',
                  headerText: 'Produce Classification',
                  makeButton: true,
                  controller: classController,
                  // suffixIcon: MdiIcons.,
            
                  onTap: ()async{
                    await showModalBottomSheet(
                      backgroundColor: Color.fromARGB(73, 36, 15, 15),
                      context: context, 
                      builder: (BuildContext context){
                        return Container(
                          padding: EdgeInsets.fromLTRB(2, 15, 2, 0),
                          
            
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              20
                            )
                          ),
            
            
                          child: ListView.builder(
                            itemCount:  classes.length,
                            itemBuilder:  (context, index) => ListTile(
                                title: Text(classes[index]),
                                trailing: Icon(
                                  classController.text == classes[index]? MdiIcons.circle  :  MdiIcons.circleOutline,
                                  color: classController.text == classes[index]?primaryColor:Colors.grey[800],
                                ),
                                onTap: () {
                                  classController.text = classes[index];
                                  Navigator.pop(context);
                                  
                                },
                              ),
                          ),
                        );
                      }
                    );
                  },
            
                ),
            
            
                
                SizedBox(height: 20),
            
            
                SingleLineField(
                  'DD/MM/YYYY',
                  headerText: 'Date of Harvest',
                  makeButton: true,
                  suffixIcon: MdiIcons.calendarMonthOutline,
                  controller: dateharvestController,
            
                  onTap: () async{
                        DateTime? date = await showDatePicker(
                          context: context, 
                          initialDate: new DateTime.now(), 
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime.now().add(Duration(days: 7000)),
                    
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: primaryColor,
                                colorScheme: ColorScheme.light(
                                  primary: primaryColor, // Header text color
                                  onPrimary: Colors.white, // Header background text color
                                  surface: primaryColor.shade100,
                                  onSurface: Colors.black,
                                ),
                                buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Button text color
                              ),
                              child: child!,
                            );
                          },
                        );
                    
                        if (date != null) {
                          dateharvestController.text = DateFormat('E d, MMM yyyy').format(date);
                          _selectedHarvest = date;
                        } else {
                          dateharvestController.text = DateFormat('E d, MMM yyyy').format(DateTime.now());
                          _selectedHarvest = DateTime.now();
                        }
                    
                        setState(() {
                          
                        });
                      },
                )       ,
            
            
            
            
                
                // SizedBox(height: 20),
            
            
                // SingleLineField(
                //   '',
                //   headerText: 'Weather conditions during planting and harvesting',
                //   controller: weatherController,
                // )       ,
            
            
            
                
                SizedBox(height: 20),
            
            
                SingleLineField(
                  '',
                  headerText: 'Farm Address',
                  controller: addressController,
                )       ,
            
            
            
                
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
            
            
                SizedBox(height: 20),
            
            
                SingleLineField(
                  '00',
                  headerText: 'Quantity (kg)',
                  controller: quantityController,
                ),
            
                SizedBox(height: 20),
            
            
            
                SingleLineField(
                  '',
                  headerText: 'Storage Facility',
                  controller: storageController,
                  // suffixIcon: MdiIcons.,
                ),
            
            
                SizedBox(height: 20),
            
            
            
                SingleLineField(
                  '',
                  headerText: 'Unit (kg)',
                  controller: unitController,
                  // suffixIcon: MdiIcons.,
                ),
            
            
                SizedBox(height: 20),
            
            
            
                SingleLineField(
                  '',
                  headerText: 'Nearest Landmark',
                  controller: landmarkController,
                  minLines: 4,
                  maxLines: 4,
                  // suffixIcon: MdiIcons.,
                ),
            
            
            
            
                 SizedBox(height: 40),
            
            
                DefaultButton(
                  label: 'Add Produce',
                  active: true,

                  onTap: () async{
                    setState(() {
                      _loading=true;
                    });

                    final fields = {
                      'name':nameController.text,
                      'quantity':quantityController.text,
                      'unit':unitController.text,
                      'description':desController.text,
                      'farm_address':addressController.text,
                      'farm_state':stateController.text,
                      'harvest_date':dateharvestController.text,
                      'planting_date':dateplantController.text,
                      'storage':storageController.text,
                      'produce_classification':classController.text,
                      'nearest_landmark':landmarkController.text
                    };


                    


                    try {
                      print('heere');
                      final _res = await httpClient.multipartReq(
                        'produce/${user.token}/create-produce',
                        fileField: '', 
                        file: File(''),
                        fields: fields,
                        token: user.token
                      );
                      

                      print(_res);

                      if (_res['status']) {

                        setState(() {
                          _loading = false;
                        });

                        showModalBottomSheet(
                          context: context, 
                          builder: (context){
                            return ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                              ),
                              
                              child: Success(
                                info: _res['message'],
                                title: 'Produce  Created',
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context, true);
                                },
                              ));
                          }
                        );
                      } else {
                        setState(() {
                          _loading = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColor.shade600,
                            content: Text(
                            _res['message'],
                            style: TextStyle(),
                          ))
                        );
                      }

                    
                    } catch (e) {

                      print(e);

                      setState(() {
                          _loading = false;
                        });
                      
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColor.shade600,
                            content: Text(
                            'Something went wrong, try again later',
                            style: TextStyle(),
                          ))
                        );
                    }



                  },
                ),
            
                SizedBox(height: 40),
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}