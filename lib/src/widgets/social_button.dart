import 'package:farmers_market/src/styles/base.dart';
import 'package:farmers_market/src/styles/buttons.dart';
import 'package:farmers_market/src/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppSocialButton extends StatelessWidget {
  final SocialType socialType;

  AppSocialButton({
    required this.socialType,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color iconColor;
    IconData icon;

    switch (socialType) {
      case SocialType.Facebook:
        buttonColor = AppColors.facebook;
        iconColor = Colors.white;
        icon = FontAwesomeIcons.facebookF;
        break;
      case SocialType.Google:
        buttonColor = AppColors.google;
        iconColor = Colors.white;
        icon = FontAwesomeIcons.google;
        break;
      default:
        buttonColor = AppColors.facebook;
        iconColor = Colors.white;
        icon = FontAwesomeIcons.facebookF;
        break;
    }

    return Container(
      height: ButtonStyles.buttonHeight,
      width: ButtonStyles.buttonHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
        boxShadow: BaseStyles.boxShadow,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}

enum SocialType { Facebook, Google }
