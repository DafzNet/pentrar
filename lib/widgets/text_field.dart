import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final VoidCallback? onChanged;

  final bool password;
  final int? maxLines;
  final int? minLines;

  final String? bottomHint;

  final TextInputType? keyboardType;
  final bool enabled;

  
  final Function(bool)? validated;
  final String pattern;
   final int minLen;
   final int maxLen;
  final List<TextInputFormatter>? inputFormatters;
  final String errorMessage;

  const SingleLineField(
    this.hint,
    {
    Key? key,
    
    this.inputFormatters,
    this.pattern = 'none',
    this.errorMessage = 'error in input',
    this.minLen = 1,
    this.maxLen = 10000000000,
    this.validated,
    this.controller,
    this.makeButton = false,
    this.password=false,
    this.onTap,
    this.prefix,
    this.suffixIcon,
    this.hintAsHead=true,
    this.headerText,
    this.persistLastValidInput = false,
    this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.bottomHint,
    this.enabled = true
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

  Color focusedColor = primaryColor.shade500;


  ////Get the validation status

  bool showPassword = true;
  TextInputType? _type = TextInputType.text;
   List<TextInputFormatter>? _formatter;


  @override
  void initState() {
    _type = widget.keyboardType;
    

    if (widget.inputFormatters ==  null) {
      if (widget.pattern == 'string') {
        _formatter = [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
        ];
      } else if(widget.pattern == 'number') {
        _type = TextInputType.number;
        _formatter = [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ];
      }else if(widget.pattern == 'email' || widget.pattern == 'none') {
        _formatter = widget.inputFormatters;
      }
    } else {
      _formatter = widget.inputFormatters;
    }
    super.initState();
  }

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
                          borderColor = focusedColor;
                          borderW= 2;
                          setState(() {
                            
                          });
                        }else{
                          borderColor = Colors.grey.shade400;
                          borderW=1;
                          setState(() {
                            
                          });
                        }
                      },
          
                      child: TextField(

                        maxLines: widget.maxLines??1,
                        minLines: widget.minLines??1,
                        

                        controller: widget.controller,
                        autocorrect: true,
                        enabled: widget.makeButton? false:widget.enabled,

                        keyboardType: _type,
                        inputFormatters: _formatter,
                    
                        onChanged:(dd){
                          

                          if (widget.pattern == 'email') {
                            final _pattern = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
                            if (!_pattern.hasMatch(dd)) {
                              errMsg = "Invalid email address";
                              validatorHeight = 20;
                              focusedColor = Colors.red;

                              if(widget.validated!=null) widget.validated!(false);
                            }else{
                              validatorHeight = 0;
                              focusedColor = primaryColor;
                              if(widget.validated!=null) widget.validated!(true);
                            }
                          } else if(widget.pattern == 'string' || widget.pattern == 'number' || widget.pattern == 'none') {
                            if (dd.trim().length < widget.minLen) {
                              errMsg = "minimum character length is ${widget.minLen}";
                              validatorHeight = 20;
                              focusedColor = Colors.red;

                              if(widget.validated!=null) widget.validated!(false);
                            }else if (dd.length > widget.maxLen) {
                              errMsg = "maximum character length exceeded";
                              validatorHeight = 20;
                              focusedColor = Colors.red;

                              if(widget.validated!=null) widget.validated!(false);
                            }
                            else{
                              validatorHeight = 0;
                              focusedColor = primaryColor;
                              if(widget.validated!=null) widget.validated!(true);
                            }
                          } else {
                            final _pattern = RegExp(widget.pattern);
                            if (!_pattern.hasMatch(dd)) {
                              errMsg = widget.errorMessage;
                              validatorHeight = 20;
                              focusedColor = Colors.red;

                              if(widget.validated!=null) widget.validated!(false);
                            }else{
                              validatorHeight = 0;
                              focusedColor = primaryColor;
                              if(widget.validated!=null) widget.validated!(true);
                            }
                          }

                          setState(() {
                            
                          });
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