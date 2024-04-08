import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:pentrar/https/services.dart';
import 'package:pentrar/models/detail_produce.dart';
import 'package:pentrar/models/produce.dart';
import 'package:pentrar/models/user.dart';
import 'package:pentrar/screens/app/home/screens/transferform.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';

class ProductDetailPage extends StatefulWidget {

  final Product  produce;

  const ProductDetailPage({
    required this.produce,
    super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
   User user = GetIt.instance<User>();
  ApiClient httpClient = ApiClient();

  Produce? _produce;


  void getProduce()async{
    print(widget.produce.id);
    var res = await httpClient.get('produce/${widget.produce.id}/get-produce', token: user.token);
    print(res);

    Map<String, dynamic>  _data = json.decode(res);
    _produce = Produce.fromJson(
      _data['data']
    );

    print(_produce);

    setState(() {
      
    });
  }


  @override
  void initState() {
    getProduce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: _produce == null?Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator(
            color: primaryColor,
          ))
        ],
      ): Padding(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),

              // _produce!.photo != null && widget.produce.photo!.isNotEmpty?
              //   CachedNetworkImage(
              //     imageUrl: _produce!.photo!,
              //   ):Container(),


              SizedBox(height: 10,),


              Row(
                children: [
                  Text(
                    _produce!.name,
                    style:  Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 10,),


              Row(
                children: [
                  Expanded(
                    child: Text(
                      _produce!.description,
                      style:  Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),


              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: _produce!.status == 'not_approved'?Color.fromARGB(255, 241, 194, 149):primaryColor2.shade100,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      _produce!.status == 'not_approved'?'Pending':'Active',
                      style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: widget.produce.status.toLowerCase()=='active'?primaryColor2.shade700:widget.produce.status.toLowerCase()=='pending'?Colors.grey.shade700:primaryColor2.shade800,
                      
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),





               SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    _produce!.quantity!=null?_produce!.quantity!.toString()+'kg':'0kg',
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),


              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Planting Date',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    DateFormat.yMMMd().format(_produce!.plantingDate),
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Classification',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    _produce!.produceClassification,
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date of Harvest',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    DateFormat.yMMMd().format(_produce!.harvestDate),
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // const SizedBox(height: 15,),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Weather condition during\nplanting and harvesting',
              //       style:  Theme.of(context).textTheme.bodySmall,
              //     ),

              //     Text(
              //       widget.produce.name,
              //       style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),



              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Farm Address',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    _produce!.farmAddress,
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),


              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Farm State',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    _produce!.farmState,
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Unit',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    _produce!.unit != null? _produce!.unit.toString()+'kg':'0kg',
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),


              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Storage Facility',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    _produce!.storage,
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),



              SizedBox(height: 45,),


              DefaultButton(
                active: _produce!=null  && _produce!.status.toLowerCase() != "not_approved",
                label: 'Transfer',


                onTap: (){
                  showModalBottomSheet(
                    context: context, 
                    builder: (context){
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height/1.3,
                          padding: EdgeInsets.all(5),
                          child: TransferForm(
                            
                          ),
                        ),
                      );
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