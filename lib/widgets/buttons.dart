// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pentrar/utils/colors.dart';
import 'package:pentrar/utils/text_styles.dart';



class AccountButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? trailingIcon;
  final String? text;
  final String? trailText;

  final bool textOnly;

  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final bool showLine;

  const AccountButton({
    this.onTap,
    this.trailingIcon,
    this.trailText,
    this.text,
    this.textOnly=false,
    this.iconColor,
    this.textColor,
    this.showLine = true,

    this.bgColor,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          TextButton(
            onPressed: onTap ?? (){},  
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
              Text(
                text??'',
                style: bodyStyle.copyWith(color: textColor?? Colors.grey.shade900),
              ),
    
              if(trailText!=null)...
                  [
                    Text(
                      trailText??'',
                      style: smallStyle,
                    )
                  ]else...
                  [Icon(
                    trailingIcon?? MdiIcons.chevronRight,
                    color: Color(0xff1A1A1A),
                    ),]
              ],
            ),
    
            style: TextButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width-30, 45),
              backgroundColor: bgColor??Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              )
            ),
          ),

          if(showLine)
            Divider(color: Colors.grey[200], height: 2,)
        ],
      ),
    );
  }
}














class DefaultButton extends StatefulWidget {
  final IconData? icon;
  final Color? iconColor;
  final Color? color;
  final Color? textColor;
  final String label;
  final VoidCallback? onTap;
  final bool active;

  final TextStyle? textStyle;

  final Size? size;

  const DefaultButton({
    this.icon,
    this.active = true,
    this.textStyle,
    this.iconColor,
    this.onTap,
    required this.label,
    this.color,
    this.textColor,
    this.size,
    super.key});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null ? TextButton(
      onPressed: widget.active? widget.onTap:null,

      style: TextButton.styleFrom(
        backgroundColor: !widget.active ? const Color.fromARGB(255, 231, 230, 230) : widget.color ??primaryColor[600],
        fixedSize: widget.size?? Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),

      child:  Text(
        widget.label,

        style: widget.textStyle?? TextStyle(
          fontSize: 18,
          color: !widget.active ? Color.fromARGB(174, 145, 144, 144): widget.textColor??Colors.white
        ),
      ),

      
    ):
    TextButton.icon(
      onPressed: widget.active? widget.onTap:null,

      style: TextButton.styleFrom(
        backgroundColor: !widget.active ? const Color.fromARGB(255, 231, 230, 230): widget.color ??primaryColor[600],
        fixedSize: widget.size?? Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),

      icon: Icon(
        widget.icon,
        color: widget.iconColor??Colors.black,
      ),

      label:  Text(
        widget.label,

        style: widget.textStyle?? TextStyle(
          fontSize: 18,
          color: !widget.active ? Color.fromARGB(174, 145, 144, 144): widget.textColor??Colors.white
        ),
      ),

      
    );
  }
}