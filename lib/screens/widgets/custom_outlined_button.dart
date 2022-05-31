import 'package:flutter/material.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/utils/size_config.dart';

class CustomOutlinedButton extends StatelessWidget {
  VoidCallback onPressed;
  String title;

  CustomOutlinedButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppTheme.accentColor.withOpacity(.2),
      borderRadius: BorderRadius.circular(56),
      onTap: onPressed,
      child: Container(
        height: SizeConfig.height * 6,
        width: SizeConfig.width*90,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.accentColor,width: 2),
          borderRadius: BorderRadius.circular(56)
        ),
        alignment: Alignment.center,
        child:  Text(
          title,
          style: TextStyle(
              color: AppTheme.accentColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
