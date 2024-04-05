import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pentrar/models/history_produce.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/sizes..dart';

class HistoryDetail extends StatefulWidget {

  final HistoryProduceModel  produce;

  const HistoryDetail({
    required this.produce,
    super.key});

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),

              widget.produce.produce != null && widget.produce.produce!.photo != null && widget.produce.produce!.photo!.isNotEmpty?
                CachedNetworkImage(
                  imageUrl: widget.produce.produce!.photo!,
                ):Container(),


              SizedBox(height: 10,),


              Row(
                children: [
                  Text(
                    widget.produce.produce!.name,
                    style:  Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 10,),


              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.produce.produce!.description,
                      style:  Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),


              SizedBox(height: 15,),


              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: primaryColor.shade300,
                    
                  )
                ),
                child: Column(
                  children: [
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
                              color: widget.produce.status.toLowerCase()=='successful'?Color.fromARGB(255, 207, 248, 209):widget.produce.status.toLowerCase()=='pending'?Color(0xffE1E8F1):Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text(
                              widget.produce.status,
                              style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: widget.produce.status.toLowerCase()=='successful'?primaryColor2.shade700:widget.produce.status.toLowerCase()=='pending'?Colors.grey.shade700:Colors.red.shade800,
                              
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
                            'Designation',
                            style:  Theme.of(context).textTheme.bodySmall,
                          ),
                
                          Text(
                            widget.produce.designation,
                            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                
                
                      SizedBox(height: 15,),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recipient',
                            style:  Theme.of(context).textTheme.bodySmall,
                          ),
                
                          Text(
                            widget.produce.recipient,
                            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                
                      SizedBox(height: 15,),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Full Name',
                            style:  Theme.of(context).textTheme.bodySmall,
                          ),
                
                          Text(
                            widget.produce.fullName,
                            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                
                
                      const SizedBox(height: 15,),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity',
                            style:  Theme.of(context).textTheme.bodySmall,
                          ),
                
                          Text(
                            widget.produce.produce!.quantity,
                            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                
                
                      SizedBox(height: 15,),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style:  Theme.of(context).textTheme.bodySmall,
                          ),
                
                          Text(
                            DateFormat.yMMMd().format(widget.produce.date??DateTime.now()),
                            style:  Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                
                
                  ],
                ),
              )

              
            ],
          ),
        ),
      ),
    );
  }
}