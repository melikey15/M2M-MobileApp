import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
final TextEditingController? controller;
final Widget? widget;
  
  const MyInputField({Key? key,
  required this.title,
  required this.hint,
   this.controller,
   this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Text(
  title,
  style: subHeadingStyle,
),
Container(
height: 52,
margin: EdgeInsets.only(top:8.0 ),
decoration: BoxDecoration(
  border: Border.all(
    color: Colors.grey,
    width: 1.0
  ),
  borderRadius: BorderRadius.circular(12)
),
child:Row(
  children: [
        Expanded(
    
      child:TextFormField(
        readOnly: widget==null?false:true,
        autofocus: false,
        controller: controller,
        style: subHeadingStyle,
        decoration: InputDecoration(
          hintStyle: subHeadingStyle,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(
color: Colors.white,
width: 0
)
          ),
          enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(
color: Colors.white,
width: 0
)
          )
        ),
      ) ,
    
    ),
    widget==null?Container():Container(child: widget),
   
  
  ],


) ,
),
      ],
      ),
    );
  }
}