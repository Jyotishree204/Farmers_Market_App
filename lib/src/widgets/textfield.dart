import 'package:farmers_market/src/styles/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/text.dart';


class AppTextField extends StatelessWidget {

  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String? errorText;


  AppTextField({
    required this.isIOS,
    required this.hintText,
    required this.materialIcon,
    required this.cupertinoIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    required this.onChanged,
    required this.errorText,

  });

  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TextFieldStyles.textBoxHorizontal,
            vertical: TextFieldStyles.textBoxVertical,
          ),
        child: Column(
          children: <Widget>[CupertinoTextField(  
            keyboardType: textInputType,
            padding: const EdgeInsets.all(12),
            placeholder: hintText,
            placeholderStyle: TextFieldStyles.placeholder,
            style: TextFieldStyles.text,
            textAlign: TextFieldStyles.textAlign,
            cursorColor: TextFieldStyles.cursorColor,
            decoration: TextFieldStyles.cupertinoDecoration,
            prefix: TextFieldStyles.iconPrefix(cupertinoIcon),
            obscureText: obscureText,
            onChanged: onChanged,
            ),
            (errorText != null) ? Padding(
              padding: const EdgeInsets.only(top: 5, left: 10,),
              child: Row(  
                children: <Widget>[
                  Text(errorText!, style: TextStyles.error,)
                ],
              ),
            ) : Container()
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TextFieldStyles.textBoxHorizontal,
            vertical: TextFieldStyles.textBoxVertical,
          ),
        child: TextField(  
          keyboardType: textInputType,
          cursorColor: TextFieldStyles.cursorColor,
          style: TextFieldStyles.text,
          textAlign: TextFieldStyles.textAlign,
          decoration: TextFieldStyles.materialDecoration(hintText, materialIcon, errorText),
          obscureText: obscureText,
          onChanged: onChanged,
        ),
      );
    }

  }
}