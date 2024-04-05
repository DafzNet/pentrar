import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/utils/sizes..dart';
import 'package:pentrar/widgets/buttons.dart';
import 'package:pentrar/widgets/success.dart';
import 'package:pentrar/widgets/text_field.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(appHorizontalPadding, appHorizontalPadding, appHorizontalPadding, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Move To',
                      style:  Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
          
                    Icon(
                      MdiIcons.closeCircleOutline
                    )
                  ],
                ),
          
                SizedBox(height: 15,),
          
                SingleLineField(
                  'select',
                  headerText: 'Useer Type',
                  makeButton: true,
                ),
          
          
                 SizedBox(height: 15,),
          
                SingleLineField(
                  '',
                  headerText: 'Useer Email',
                ),
          
                 SizedBox(height: 15,),
          
                SingleLineField(
                  '00',
                  headerText: 'Quantity',
                ),
          
                 SizedBox(height: 15,),
          
                SingleLineField(
                  '',
                  headerText: 'Unit',
                  makeButton: true,
                ),
          
          
                 SizedBox(height: 15,),
          
                DefaultButton(
                  label: 'Complete Transfer',

                  onTap: (){
                    Navigator.pop(context);

                    showModalBottomSheet(
                      context: context, 
                      builder: (context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
                          child: Success(
                            title: 'Produce Transferred',
                            onTap: (){
                              Navigator.pop(context);
                            }
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