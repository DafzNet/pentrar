import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/models/history_produce.dart';
import 'package:pentrar/screens/app/history/detail.dart';
import 'package:pentrar/screens/app/home/screens/product_detail.dart';
import 'package:pentrar/utils/colors.dart';

class HistoryTile extends StatefulWidget {
  final HistoryProduceModel  produce;
  const HistoryTile({
    required this.produce,
    super.key});

  @override
  State<HistoryTile> createState() => _HistoryTileState();
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: HistoryDetail(
              produce: widget.produce
            ),

            type: PageTransitionType.fade
          )
        );
      },
      title: Text(
        widget.produce.produce!.name,
        style:  Theme.of(context).textTheme.titleSmall,
      ),


      subtitle: Text(
        '${widget.produce.produce!.quantity}/kg',
        style:  Theme.of(context).textTheme.bodySmall,
      ),


      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),

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

        ]
      ),

      tileColor: Colors.white,
    );
  }
}