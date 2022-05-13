import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/text.dart';
import 'package:farmers_market/src/widgets/button.dart';
import 'package:farmers_market/src/widgets/social_button.dart';
import 'package:farmers_market/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

import '../blocks/auth_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: pageBody(context, authBloc),
      );
    } else {
      return Scaffold(
        body: pageBody(context, authBloc),
      );
    }
  }

  Widget pageBody(BuildContext context, AuthBloc authBloc) {
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
        StreamBuilder<String>(
          stream: authBloc.email,
          builder: (context, snapshot) {
            return AppTextField(
                isIOS: Platform.isIOS,
                hintText: 'Email',
                materialIcon: Icons.email,
                cupertinoIcon: CupertinoIcons.mail_solid,
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                onChanged: authBloc.changeEmail,
                );
          }
        ),

        StreamBuilder<String>(
          stream: authBloc.password,
          builder: (context, snapshot) {
            return AppTextField(
                isIOS: Platform.isIOS,
                hintText: 'Password',
                materialIcon: Icons.lock,
                cupertinoIcon: const IconData(0xf4c9,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage),
                    textInputType: TextInputType.text,
                    obscureText: true, 
                    errorText: snapshot.hasError ? snapshot.error.toString() : null, 
                    onChanged: authBloc.changePassword,
                );
          }
        ),

          AppButton(buttonText: 'Login', buttonType: ButtonType.LightBlue,),
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
                text: 'New here? ',
                style: TextStyles.body,
                children: [
                  TextSpan(text: 'Signup', style: TextStyles.link, 
                  recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.pushNamed(context, '/signup'))
                ]
              )),
          ),
      ],
    );
  }
}
