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


  bool _enabled = true;


  void getVerStats()async{
    var res = await httpClient.get('farmer/${user.id}/individual-farmer', token: user.token);

    Map<String, dynamic>  data = json.decode(res);
            
    if (data['data']['status'] == 'pending'){
      setState(() {
        _enabled=false;
      });
    }
  }

  @override
  void initState() {
    getVerStats();
    super.initState();
  }


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
              
              if(!_enabled)
              Column(
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
                                    'Complete Your Profile',
                                    style:  Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                        
                              SizedBox(height: 10,),
                        
                               Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '',
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
                  ),

              SizedBox(height: 15,),


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


                  FutureBuilder(
                    future: httpClient.get('farmer/${user.id}/recentproduce', token: user.token),
                    builder: (context, snapshot) {
                      if (snapshot.hasError || snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                              // print(snapshot.error);
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Loading...',
                            style:  Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        );
                      }

                      final  jsonData = json.decode(snapshot.data);
                      List products = jsonData['data'].map((item) => Product.fromMap(item)).toList();

                      print(jsonData);
                      
                      return Column(
                        children: [
                          ...products.take(5).map((e) => ProduceTile(produce: e))
                        ],
                      );
                    }
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