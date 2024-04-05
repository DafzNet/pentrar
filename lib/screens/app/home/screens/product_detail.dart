import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pentrar/models/produce.dart';
import 'package:pentrar/screens/app/home/screens/transferform.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';

class ProductDetailPage extends StatefulWidget {

  final ProduceModel  produce;

  const ProductDetailPage({
    required this.produce,
    super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),

              widget.produce.photo != null && widget.produce.photo!.isNotEmpty?
                CachedNetworkImage(
                  imageUrl: widget.produce.photo!,
                ):Container(),


              SizedBox(height: 10,),


              Row(
                children: [
                  Text(
                    widget.produce.name,
                    style:  Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 10,),


              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.produce.description,
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
                      color: widget.produce.status.toLowerCase()=='active'?primaryColor2.shade100:widget.produce.status.toLowerCase()=='pending'?Color(0xffE1E8F1):Color(0xffD4F7F3),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      widget.produce.status,
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
                    widget.produce.quantity+'kg',
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
                    DateFormat.yMMMd().format(widget.produce.plantingDate??DateTime.now()),
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seasons',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    widget.produce.season,
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
                    DateFormat.yMMMd().format(widget.produce.harvestDate??DateTime.now()),
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weather condition during\nplanting and harvesting',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    widget.produce.weather,
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),



              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Farm Address',
                    style:  Theme.of(context).textTheme.bodySmall,
                  ),

                  Text(
                    widget.produce.address,
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
                    widget.produce.state,
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
                    widget.produce.storage,
                    style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),



              SizedBox(height: 45,),


              DefaultButton(
                active: widget.produce.status.toLowerCase() == "active",
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