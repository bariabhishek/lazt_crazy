import 'package:flutter/material.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPressed;
  String title;

  CustomButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppTheme.primaryColor,
      height: SizeConfig.height * 6,
      minWidth: SizeConfig.width * 90,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
