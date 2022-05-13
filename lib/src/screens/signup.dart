import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:farmers_market/src/widgets/button.dart';
import 'package:farmers_market/src/widgets/social_button.dart';
import 'package:farmers_market/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Signup extends StatelessWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    } else{
      return Scaffold(
        body: pageBody(context),
      );
    }
  }


  Widget pageBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/top_bg.png'),
            fit: BoxFit.fill,
          )),
        ),
        Container(
          height: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.contain,
          )),
        ),
        AppTextField(
            isIOS: Platform.isIOS,
            hintText: 'Email',
            materialIcon: Icons.email,
            cupertinoIcon: CupertinoIcons.mail_solid,
            textInputType: TextInputType.emailAddress,
            obscureText: false, errorText: '', onChanged: (String ) {  },
            ),

        AppTextField(
            isIOS: Platform.isIOS,
            hintText: 'Password',
            materialIcon: Icons.lock,
            cupertinoIcon: const IconData(0xf4c9,
                fontFamily: CupertinoIcons.iconFont,
                fontPackage: CupertinoIcons.iconFontPackage),
                textInputType: TextInputType.text,
                obscureText: true, errorText: '', onChanged: (String ) {  },
            ),

          AppButton(buttonText: 'Signup', buttonType: ButtonType.LightBlue,),
          SizedBox(height: 6,),
          Center(child: Text('Or', style: TextStyles.suggestion,),),
          SizedBox(height: 6,),
          Padding(
            padding: BaseStyles.listPadding,
            child: Row(  
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AppSocialButton(socialType: SocialType.Facebook),
                SizedBox(width: 30,),
                AppSocialButton(socialType: SocialType.Google),
              ],
            ),
          ),
          Padding(
            padding: BaseStyles.listPadding,
            child: RichText(
              textAlign: TextAlign.center,
              text:TextSpan(  
                text: 'Already have an account? ',
                style: TextStyles.body,
                children: [
                  TextSpan(text: 'Login', style: TextStyles.link, 
                  recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.pushNamed(context, '/login'))
                ]
              )),
          ),
      ],
    );
  }
}