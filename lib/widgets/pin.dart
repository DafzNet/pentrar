// // ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously, empty_catches

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:payquid/widgets/loading_indicator.dart';

// class PinScreen extends StatefulWidget {
//   final String? header;
//   final String? subHeader;
//   final Map<String, dynamic>? data;
//   final bool verify;

//   final Future<void> Function(String, Map<String, dynamic>?, BuildContext?)? onCompleted;

//   const PinScreen({
//     this.header,
//     this.subHeader,
//     this.verify = true,

//     this.onCompleted,
//     this.data = const {'':''},
//     super.key});

//   @override
//   State<PinScreen> createState() => _PinScreenState();
// }

// class _PinScreenState extends State<PinScreen> {
  
//   @override
//   void initState() {
//    // getOndevice();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),

//       body: LoadingIndicator(
//         loading: true,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               //height: (MediaQuery.of(context).size.height/2)-70,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: Row(
//                       children: [
//                         Text(
//                           widget.header??'Enter Transaction PIN',
//                           fontSize: 20,
//                           weight: FontWeight.w700
//                         ),
//                       ],
//                     ),
//                   ),

//                   Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Row(
//                 children: [
//                   BodyText(
//                     widget.subHeader??'Input your 4 digit passcode to authorize transaction.',
//                     fontSize: 14,
//                     weight: FontWeight.w400
//                   ),
//                 ],
//               ),
//             ),


//             const SizedBox(height: 100,),


//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
                  
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     color: otpController.text.isNotEmpty?pillaColor:Colors.white,
//                     border: Border.all(
//                       color: pillaColor,
//                       width: 2
//                     ),
//                     borderRadius: BorderRadius.circular(100)
//                   ),
//                 ),

//                 const SizedBox(width: 15,),

//                 Container(
                  
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     color: otpController.text.length>=2?pillaColor:Colors.white,
//                     border: Border.all(
//                       color: pillaColor,
//                       width: 2
//                     ),
//                     borderRadius: BorderRadius.circular(100)
//                   ),
//                 ),

//                 const SizedBox(width: 15,),


//                 Container(
                  
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     color: otpController.text.length>=3?pillaColor:Colors.white,
//                     border: Border.all(
//                       color: pillaColor,
//                       width: 2
//                     ),
//                     borderRadius: BorderRadius.circular(100)
//                   ),
//                 ),

//                 const SizedBox(width: 15,),


//                 Container(
                  
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     color: otpController.text.length==4?pillaColor:Colors.white,
//                     border: Border.all(
//                       color: pillaColor,
//                       width: 2
//                     ),
//                     borderRadius: BorderRadius.circular(100)
//                   ),
//                 )
//               ],
//             ),
      
//                 ],
//               ),
//             ),
      
            
//             Container(
//               padding: const EdgeInsets.all(15),
//               height: (MediaQuery.of(context).size.height/2),
//               color: Color.fromARGB(255, 240, 241, 241),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '1';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;

//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }

                                                       
                              
                              
//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }

//                             setState(() {
                              
//                             });

                            
//                           }
//                         },

//                         child: Text(
//                           '1',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '2';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;

//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }
                              
//                               setState(() {
//                               _load = false;
//                             });

//                             }
//                             setState(() {
                              
//                             });
//                           }                              
//                         }, 
//                         child: Text(
//                           '2',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '3';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }

//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }

//                             setState(() {
                              
//                             });
                            
//                           }
//                         }, 
//                         child: Text(
//                           '3',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         ))
//                     ],
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '4';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                              if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               } 

//                               setState(() {
//                               _load = false;
//                             });
//                             }
//                             setState(() {
                              
//                             });
//                           }
//                         }, 
//                         child: Text(
//                           '4',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '5';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }

//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }
//                            setState(() {
                              
//                             });
//                           }
//                         }, 
//                         child: Text(
//                           '5',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '6';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }

//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }
//                             setState(() {
                              
//                             });
                            
//                           }
//                         }, 
//                         child: Text(
//                           '6',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         ))
//                     ],
//                   ),


//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '7';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }

//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }
//                             setState(() {
                              
//                             });
                            
//                           }
//                         }, 
//                         child: Text(
//                           '7',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '8';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               } 

//                               setState(() {
//                               _load = false;
//                             });

//                             }
                            
//                             setState(() {
                              
//                             });
//                           }
//                         }, 
//                         child: Text(
//                           '8',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '9';

//                             setState(() {
                              
//                             });

//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }
                              
//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }

//                             setState(() {
                              
//                             });
                           
//                           }
//                         }, 
//                         child: Text(
//                           '9',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         ))
//                     ],
//                   ),


//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //userOndeviceSecurity!.enableBio==true && userOndeviceSecurity!.pin!=null?
//                       IconButton(
//                         iconSize: 30,
//                         onPressed: ()async{
//                           bool canCheckBiometrics = false;
//                           try {
//                             canCheckBiometrics = await auth.canCheckBiometrics;
//                             print(canCheckBiometrics);

//                             List<BiometricType> availableBiometrics;

//                             availableBiometrics = await auth.getAvailableBiometrics();
                            
//                             if (canCheckBiometrics) {
//                               setState(() {
//                                 fingerPrintMode = true;
//                               });

//                               bool authenticated = false;
                            
//                               authenticated = await auth.authenticate(
//                                 localizedReason: 'Verify fingerprint to proceed',
//                               );

//                               if(authenticated){
//                                 fingerPrintColor = Colors.green;
//                                 _load = true;

//                                 setState(() {
                                  
//                                 });

//                                 await widget.onCompleted!('',widget.data, context);


//                               }else{
//                                 fingerPrintColor = Colors.redAccent;
//                                 setState(() {
                                  
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Finger Print Authentication Unsuccessful")));
//                               }


//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 pillaSnackbar('Fingerprint not supported on this device')
//                               );
//                             }

                            

//                           } catch (e) {
//                           }
                          
//                         }, 
//                         icon: Icon(
//                           MdiIcons.fingerprint,
//                           color: pillaColor,
//                         )),
//                         // )):
//                         // SizedBox(
//                         //   width: 35,
                          
//                         // ),

//                         TextButton(
//                         onPressed: ()async{
//                           if (otpController.text.length<4) {
//                             otpController.text += '0';

//                             setState(() {
                              
//                             });


//                             if (otpController.text.length==4) {
                          
//                               _load = true;
                              
//                               if (widget.verify) {
//                                 bool correctPin = await verifyPin();
//                                 if (correctPin) {
//                                   await widget.onCompleted!(otpController.text,widget.data, context);
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     pillaSnackbar('Incorrect Pin, please try again')
//                                   );
//                                 }
//                               } else {
//                                 await widget.onCompleted!(otpController.text,widget.data, context);
//                               }

//                               setState(() {
//                               _load = false;
//                             });

                          
//                             }
//                             setState(() {
                              
//                             });
//                           }
//                         }, 
//                         child: Text(
//                           '0',
//                           style: TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.w800
//                           ),
//                         )),

//                       IconButton(
//                         onPressed: (){
//                           if (otpController.text.isNotEmpty) {
//                             otpController.text = otpController.text.substring(0, otpController.text.length-1);
//                             setState(() {
                              
//                             });
//                           }
//                         }, 
//                         icon: Icon(
//                           MdiIcons.backspaceOutline,
//  //                            size: 30,
//                           color: Colors.red,
//                         ))
//                     ],
//                   ),

//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }