import 'package:flutter/material.dart';
import 'package:pentrar/utils/images.dart';
import 'package:pentrar/widgets/buttons.dart';

class Success extends StatefulWidget {

  final String? title;
  final String? info;
  final String? buttonLabel;

  final VoidCallback onTap;


  const Success({
    this.title,
    this.info,
    this.buttonLabel,
    required this.onTap,
    super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              success
            ),
          ),

          Text(
            widget.title?? 'Completed',
             style: Theme.of(context).textTheme.titleLarge,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.info?? 'Est cupidatat excepteur laborum tempor deserunt culpa dolor cillum eiusmod exercitation laborum ea.',
              textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(10),
            child: DefaultButton(
              label: widget.buttonLabel?? 'Done',

              onTap: widget.onTap,
            ),
          )



        ],
      ),
    );
  }
}