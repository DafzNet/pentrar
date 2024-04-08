// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/models/detail_produce.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/screens/app/home/components/produce_tile.dart';
import 'package:pentrar/screens/app/home/screens/add_produce.dart';
import 'package:pentrar/utils/sizes..dart';

import '../../../models/produce.dart';
import '../../../utils/colors.dart';

class Procedure extends StatefulWidget {

  const Procedure({super.key});

  @override
  State<Procedure> createState() => _ProcedureState();
}

class _ProcedureState extends State<Procedure> {
  User user = GetIt.instance<User>();

  ApiClient httpClient = ApiClient();

  List<Produce>? _produce;
  String _status = 'Status';
  String _date = 'This month';


  void getProduces()async{
    var res = await httpClient.get('farmer/${user.id}/individual-farmer', token: user.token);

    Map<String, dynamic>  _data = json.decode(res);
    Map<String, dynamic>  data = Map<String, dynamic>.from(_data['data'] as Map<String,dynamic>);
    // print(_data['data']['list_of_produce:']);
    print(data['list_of_produce']);
    _produce = [];
    
   for (var e in data['list_of_produce']) {
     _produce!.add(Produce.fromJson(e));
   }

    setState(() {
      
    });
  }

  @override
  void initState() {
    getProduces();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Produce'
        ),

        actions: [
          IconButton(
            onPressed: null, 
            icon: Icon(
              Icons.search
            )
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: Column(
        
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()async{
                      await showModalBottomSheet(
                        context: context, 
                        builder: (context){
                          return Container(
                            height: 250,
                            child: Column(children: [
                              ListTile(
                                title: Text(
                                  'This Month'
                                ),

                                trailing: Icon(
                                  _date == 'This Month'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _date = 'This Month';

                                  setState(() {
                                    
                                  });
                                },
                              ),


                              ListTile(
                                title: Text(
                                  'Last Month'
                                ),

                                trailing: Icon(
                                  _date == 'Last Month'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _date = 'Last Month';

                                  setState(() {
                                    
                                  });
                                },
                              ),



                              ListTile(
                                title: Text(
                                  'Custom Date'
                                ),

                                trailing: Icon(
                                  _date == 'Pending'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _date = 'Pending';

                                  setState(() {
                                    
                                  });
                                },
                              )
                            ],),
                          );
                        }
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        _date,
                        style:  Theme.of(context).textTheme.titleSmall,
                      ),
                  
                      SizedBox(width: 5,),
                  
                      Icon(
                        MdiIcons.chevronDown
                      )
                    ],
                  ),
                ),


                InkWell(
                  onTap: ()async{
                      await showModalBottomSheet(
                        context: context, 
                        builder: (context){
                          return Container(
                            height: 250,
                            child: Column(children: [
                              ListTile(
                                title: Text(
                                  'Active'
                                ),

                                trailing: Icon(
                                  _status == 'Active'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _status = 'Active';

                                  setState(() {
                                    
                                  });
                                },
                              ),


                              ListTile(
                                title: Text(
                                  'Submitted'
                                ),

                                trailing: Icon(
                                  _status == 'Submitted'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _status = 'Submitted';

                                  setState(() {
                                    
                                  });
                                },
                              ),



                              ListTile(
                                title: Text(
                                  'Pending'
                                ),

                                trailing: Icon(
                                  _status == 'Pending'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _status = 'Pending';

                                  setState(() {
                                    
                                  });
                                },
                              )
                            ],),
                          );
                        }
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        _status,
                        style:  Theme.of(context).textTheme.titleSmall,
                      ),
                  
                      SizedBox(width: 5,),
                  
                      Icon(
                        MdiIcons.chevronDown
                      )
                    ],
                  ),
                )
              ],
            ),


            SizedBox(height: 10,),

            // ..._produce!.map(
            //   (e) => Column(
            //     children: [
            //       ProduceTile(produce: e),
            //       SizedBox(height: 5,)
            //     ],
            //   )
            // ).toList()
        
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            PageTransition(
              child: AddProduce(),
              type: PageTransitionType.bottomToTop
            )
          );
        },

        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(MdiIcons.plus, color: Colors.white, size: 40,),
      ),

    );
  }
}