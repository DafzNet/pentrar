// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/screens/app/history/history_tile.dart';
import 'package:pentrar/utils/sizes..dart';

import '../../../models/history_produce.dart';
import '../../../models/produce.dart';

class History extends StatefulWidget {

  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<HistoryProduceModel> _produce = [


  ];
  String _status = 'Status';
  String _date = 'This month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'History'
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
                                  'Successful'
                                ),

                                trailing: Icon(
                                  _status == 'Successful'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _status = 'Successful';

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
                              ),



                              ListTile(
                                title: Text(
                                  'Failed'
                                ),

                                trailing: Icon(
                                  _status == 'Failed'? MdiIcons.circle:MdiIcons.circleOutline
                                ),


                                onTap: (){
                                  Navigator.pop(context);
                                  _status = 'Failed';

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

            ..._produce.map(
              (e) => Column(
                children: [
                  HistoryTile(produce: e),
                  SizedBox(height: 5,)
                ],
              )
            ).toList()
        
          ],
        ),
      ),
    );
  }
}