import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';





class SingleLineField extends StatefulWidget {

  final String hint;
  final TextEditingController? controller;
  final bool persistLastValidInput;

  final bool hintAsHead;
  final String? headerText;


  final bool makeButton;
  final VoidCallback? onTap;

  final Widget? prefix;
  final IconData? suffixIcon;
  final Map<String, dynamic> Function(String)? valdator;
  final VoidCallback? onChanged;

  final bool password;
  final int? maxLines;
  final int? minLines;

  final String? bottomHint;

  final TextInputType? keyboardType;

  const SingleLineField(
    this.hint,
    {
    Key? key,
    this.controller,
    this.makeButton = false,
    this.password=false,
    this.onTap,
    this.prefix,
    this.suffixIcon,
    this.hintAsHead=true,
    this.headerText,
    this.valdator,
    this.persistLastValidInput = false,
    this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.bottomHint
    }) : super(key: key);

  @override
  State<SingleLineField> createState() => _SingleLineFieldState();
}

class _SingleLineFieldState extends State<SingleLineField> {

  Color? borderColor = Colors.grey.shade400;
  double borderW = .5;

  void saveLastValidInput(String text)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(widget.hint.toLowerCase().replaceAll(RegExp(r'\s'), '_'), text);
  }

  bool showPwd = false;
  double validatorHeight = 0;
  String? errMsg;


  ////Get the validation status
  void validate(String n){

    if(widget.valdator != null && !widget.valdator!(n)['valid']){
      
      setState(() {
        validatorHeight=20;
        errMsg=widget.valdator!(n)['message'];
        borderColor = Colors.redAccent;
      });
    }
    else{
      setState(() {
        validatorHeight=0;
        errMsg='';
        borderColor = primaryColor;
      });
      if(widget.persistLastValidInput){saveLastValidInput(n);}
    }
  }

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      
      child: Column(
        children: [

          if(widget.hintAsHead)...
            [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text(
                      widget.headerText??widget.hint,
                      style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                      ),
                    ),
                  ],
                ),
              )
            ],


          GestureDetector(
            onTap: widget.makeButton? widget.onTap:null,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: widget.maxLines == null || widget.minLines == null? 46:null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderColor!,
                  width: borderW
                )
              ),
          
          
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(widget.prefix!=null)...
                    [Flexible(
                    flex: 1,
                    child: widget.prefix!
                  )],
          
          
          
                  Flexible(
          
                    flex:  8,
                    child: Focus(
          
                      onFocusChange: (focus){
                        if(focus){
                          borderColor = primaryColor.shade600;
                          borderW= 2;
                          setState(() {
                            
                          });
                        }else{
                          borderColor = primaryColor.shade200;
                          borderW=1;
                          setState(() {
                            
                          });
                        }
                      },
          
                      child: TextField(

                        maxLines: widget.maxLines,
                        minLines: widget.minLines,
                        

                        controller: widget.controller,
                        autocorrect: true,
                        enabled: widget.makeButton? false:true,

                        keyboardType: widget.keyboardType,
                    
                        onChanged:(dd){
                          if(widget.onChanged != null){
                            widget.onChanged!();
                          }
                          
                          validate(dd);
                        },
                        onSubmitted: saveLastValidInput,
                        obscureText: widget.password? showPassword:false,
                        
          
                        style: const TextStyle(
                          fontSize: 14
                        ),
                        
                        decoration: InputDecoration.collapsed(
                          hintText: widget.hint,
                    
                        ),
                      ),
                    ),
                  ),

                  if(widget.makeButton)...
                    [
                      Flexible(
                      flex: 1,
                      child: Icon(
                       widget.suffixIcon?? MdiIcons.chevronDown
                      )
                    
                  )
                ],

                if(widget.password && !widget.makeButton)...
                    [Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          showPassword = !showPassword;

                          setState(() {
                            
                          });
                        },
                        child: Icon(
                          showPassword? MdiIcons.eye:MdiIcons.eyeOff
                        ),
                      )
                    
                  )
                ]
          
                ],
              ),
          
          
            ),
          ),

          if(widget.bottomHint != null)...
            [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Text(
                      widget.bottomHint!,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      
                    ),
                  ],
                ),
              )
            ],

          const SizedBox(
            height: 5,
          ),


          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: validatorHeight,

                child: Text(
                  '$errMsg',
                  textAlign: TextAlign.start,

                  style: TextStyle(
                    color: Colors.redAccent
                  ),
                  ),
              ),
            ],
          )

        ],
      ),
    );
  }
}