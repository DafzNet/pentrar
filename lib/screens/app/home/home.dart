import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/models/produce.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/screens/app/home/screens/add_produce.dart';
import 'package:pentrar/screens/app/home/screens/bizprof.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/images.dart';
import 'package:pentrar/utils/sizes..dart';

import 'components/produce_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user = GetIt.instance<User>();
  List _transactions = ['not empty'];

  ApiClient httpClient = ApiClient();


  bool _enabled = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             'Hello, ${user.firstName}',
            
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
              
            ),

            SizedBox(height: 10,),

            Text(
              'Farm Produce Dashboard',
            
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor.shade600,
        toolbarHeight: 100,

        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
        )
      ),




      floatingActionButton: FloatingActionButton(
        onPressed: !_enabled?(){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: primaryColor.shade600,
              content: Text(
              'Complete ypur profile then try again',
              style: TextStyle(),
            ))
          );
        }: (){
          Navigator.push(
            context,
            PageTransition(
              child: AddProduce(),
              type: PageTransitionType.bottomToTop
            )
          );
        },

        backgroundColor: primaryColor.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(MdiIcons.plus, color: Colors.white, size: 40,),
      ),
      

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
          child: Column(
            children: [
              SizedBox(height: 10,),

              Container(
                height: 120,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total Produce',
                          style:  Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),

                     Row(
                      children: [
                        FutureBuilder(
                          future: httpClient.get('farmer/${user.id}/dashboardcount', token: user.token),
                          builder: (context, snapshot) {
                            if (snapshot.hasError || snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                              // print(snapshot.error);
                              return Text(
                                '0',
                                style:  Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800, fontSize: 24),
                              );
                            }
                            

                            Map<String, dynamic>  data = json.decode(snapshot.data);
                            print(data);


                            return Text(
                              data['data']['counted_produce'].toString(),
                              style:  Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800, fontSize: 24),
                            );
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),


              SizedBox(height: 15,),
              FutureBuilder(
                future: httpClient.get('farmer/${user.id}/individual-farmer', token: user.token),
                builder: (context, snapshot) {
                  if (snapshot.hasError || snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                              // print(snapshot.error);
                    return Container();
                  }
                  

                  Map<String, dynamic>  data = json.decode(snapshot.data);
                  print(data);

                  if (data['data']['status'] == 'pending')
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Action Needed',
                            style:  Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      
                      InkWell(
                        onTap: ()async{
                          bool _res= await Navigator.push(
                            context,
                            PageTransition(child: BusinessProfileType(), type: PageTransitionType.fade)
                          );

                          setState(() {
                            _enabled = true;
                          });
                        },

                        child: Container(
                          height: 120,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color.fromARGB(255, 252, 128, 128))
                          ),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Complete Business Profile',
                                    style:  Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                        
                              SizedBox(height: 10,),
                        
                               Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Ex occaecat id ullamco aliquip Lorem sit. Ex occaecat id ullamco aliquip Lorem sit.',
                                      style:  Theme.of(context).textTheme.bodyMedium!,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                  setState(() {
                    _enabled = true;
                  });
                  return Container();
                }
              ),




              SizedBox(height: 15,),


            _transactions.isEmpty?
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'My Produces',
                            style:  Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                          ),

                          Icon(
                            MdiIcons.textSearchVariant
                          )
                      ],
                    ),



                    Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: Image.asset(
                        world
                      ),
                    )
                  ],
                ),
              ):

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Produce',
                        style:  Theme.of(context).textTheme.titleSmall,
                      ),
                  
                  
                      Text(
                        'See all',
                        style:  Theme.of(context).textTheme.bodyMedium,
                      ),
                  
                        
                    ],
                  ),



                  SizedBox(height: 10,),


                  ProduceTile(
                    produce: ProduceModel(
                      description: 'Et dolor duis eiusmod sit pariatur irure qui laboris deserunt deserunt occaecat exercitation et nostrud.',
                    ),
                  )


                ],
              ),
  
            ],
          ),
        ),
      )
    );
  }
}