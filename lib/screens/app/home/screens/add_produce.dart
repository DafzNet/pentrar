import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/text_field.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../widgets/buttons.dart';

class AddProduce extends StatefulWidget {
  const AddProduce({super.key});

  @override
  State<AddProduce> createState() => _AddProduceState();
}

class _AddProduceState extends State<AddProduce> {

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
  TextEditingController  seasonController = TextEditingController();
  TextEditingController  addressController = TextEditingController();
  TextEditingController  dateharvestController = TextEditingController();
  TextEditingController  stateController = TextEditingController();
  TextEditingController  weatherController = TextEditingController();
  final quantityController = TextEditingController();
  final storageController = TextEditingController();

  final dateplantController = TextEditingController();



  DateTime _selected = DateTime.now();
  DateTime _selectedHarvest = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Add Produce'),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),


              Row(
                children: [
                  Text(
                    'Add Image',
                    style: Theme.of(context).textTheme.bodyMedium,
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
                    child: Image.asset(
                      camera
                    ),
                  ),
                ],
              ),


              

              SingleLineField(
                'Enter product name',
                headerText: 'Product Name',
              ),


              const SizedBox(height: 20),


              SingleLineField(
                '',
                headerText: 'Product Description',
                maxLines: 10,
                minLines: 5,

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
                headerText: 'Season',
                makeButton: true,
                controller: seasonController,
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
                              title: Text('Dry Season'),
                              trailing: Icon(
                                seasonController.text == 'Dry Season'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                color: seasonController.text == 'Dry Season'?primaryColor:Colors.grey[800],
                              ),
                              onTap: () {
                                seasonController.text = 'Dry Season';
                                Navigator.pop(context);
                                
                              },
                            ),


                            ListTile(
                              title: Text('Rainy Season'),
                              trailing: Icon(
                                seasonController.text == 'Rainy Season'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                color: seasonController.text == 'Rainy Season'?primaryColor:Colors.grey[800],
                              ),
                              onTap: () {
                                seasonController.text = 'Rainy Season';
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
                        _selected = date;
                      } else {
                        dateharvestController.text = DateFormat('E d, MMM yyyy').format(DateTime.now());
                        _selectedHarvest = DateTime.now();
                      }
                  
                      setState(() {
                        
                      });
                    },
              )       ,




              
              SizedBox(height: 20),


              SingleLineField(
                '',
                headerText: 'Weather conditions during planting and harvesting',
                controller: weatherController,
              )       ,



              
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
                headerText: 'Quantity',
                controller: quantityController,
              ),

              SizedBox(height: 20),



              SingleLineField(
                'select',
                headerText: 'Storage Facility',
                makeButton: true,
                controller: storageController,
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
                              title: Text('Dry Season'),
                              trailing: Icon(
                                storageController.text == 'Dry Season'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                color: storageController.text == 'Dry Season'?primaryColor:Colors.grey[800],
                              ),
                              onTap: () {
                                storageController.text = 'Dry Season';
                                Navigator.pop(context);
                                
                              },
                            ),


                            ListTile(
                              title: Text('Rainy Season'),
                              trailing: Icon(
                                storageController.text == 'Rainy Season'? MdiIcons.circle  :  MdiIcons.circleOutline,
                                color: storageController.text == 'Rainy Season'?primaryColor:Colors.grey[800],
                              ),
                              onTap: () {
                                storageController.text = 'Rainy Season';
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


               SizedBox(height: 40),


              DefaultButton(
                label: 'Update Produce'
              ),

              SizedBox(height: 40),


            ],
          ),
        ),
      ),
    );
  }
}