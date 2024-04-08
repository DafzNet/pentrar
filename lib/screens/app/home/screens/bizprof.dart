import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pentrar/screens/app/home/screens/bizinfo.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/sizes..dart';

import '../../../../widgets/buttons.dart';



enum BizType {
  individual,
  corperate
}


extension BizTypeExtension on BizType {
  String get name {
    switch (this) {
      case BizType.individual:
        return 'Individual';
      case BizType.corperate:
        return 'Corperate';
      
    }
  }
}



class BusinessProfileType extends StatefulWidget {
  const BusinessProfileType({super.key});

  @override
  State<BusinessProfileType> createState() => _BusinessProfileTypeState();
}

class _BusinessProfileTypeState extends State<BusinessProfileType> {


  BizType? bizType = BizType.individual;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(appHorizontalPadding),
        child: Column(
          children: [
        
            SizedBox(height: 10,),
        
            Row(
              children: [
                Text(
                  'Select Business Type',
                  style:  Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            
            SizedBox(height: 15,),

            RadioListTile(
              value: BizType.individual, 
              groupValue: bizType, 
              onChanged: (BizType? biz){
                bizType = biz!;

                setState(() {
                  
                });
              },

              title: const Text('Individual'),
              controlAffinity: ListTileControlAffinity.trailing,

              tileColor: bizType == BizType.individual? Colors.white:Theme.of(context).scaffoldBackgroundColor,
              activeColor: primaryColor2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: bizType == BizType.individual? primaryColor2:Colors.grey)),
            ),

            SizedBox(height: 15,),

            RadioListTile(
              value: BizType.corperate,
              groupValue: bizType, 
              onChanged: (biz){
                setState(() {
                  bizType = biz!;
                });
              },

              title: const Text('Corperate'),
              controlAffinity: ListTileControlAffinity.trailing,

              tileColor: bizType == BizType.corperate? Colors.white:Theme.of(context).scaffoldBackgroundColor,
              activeColor: primaryColor2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), 
              side: BorderSide(color: bizType == BizType.corperate? primaryColor2:Colors.grey)),
            ),



            SizedBox(height: 80,),

            DefaultButton(
              active: bizType != null,
              label: 'Continue',

              onTap: (){
                print(bizType!.name);
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: BusinessInfo(
                      bizType: bizType!.name,
                    ),
                    type: PageTransitionType.bottomToTop
                  )
                );
              },
            )

          ],
        ),
      ),
    );
  }
}