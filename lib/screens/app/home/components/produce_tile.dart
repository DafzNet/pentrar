import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/models/produce.dart';
import 'package:pentrar/screens/app/home/screens/product_detail.dart';
import 'package:pentrar/utils/colors.dart';

class ProduceTile extends StatefulWidget {
  final Product  produce;
  const ProduceTile({
    required this.produce,
    super.key});

  @override
  State<ProduceTile> createState() => _ProduceTileState();
}

class _ProduceTileState extends State<ProduceTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ProductDetailPage(
              produce: widget.produce
            ),

            type: PageTransitionType.fade
          )
        );
      },
      title: Text(
        widget.produce.name,
        style:  Theme.of(context).textTheme.titleSmall,
      ),


      subtitle: Text(
        'Quantity: ${widget.produce.quantity}/kg',
        style:  Theme.of(context).textTheme.bodySmall,
      ),


      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),



          Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: widget.produce.status == 'not_approved'?Color.fromARGB(255, 241, 194, 149):primaryColor2.shade100,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Text(
              widget.produce.status == 'not_approved'?'Pending':'Active',
              style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: widget.produce.status.toLowerCase()=='active'?primaryColor2.shade700:widget.produce.status.toLowerCase()=='pending'?Colors.grey.shade700:primaryColor2.shade800,
              
                fontWeight: FontWeight.bold),
            ),
          ),

        ]
      ),

      tileColor: Colors.white,
    );
  }
}