import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/utils/size_config.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  RxBool isShowPassword = false.obs;
  final String labelText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? prefix;
  VoidCallback? onIconTap;
  FormFieldValidator<String>? onValidate;
  ValueChanged<String>? onChange;

  CommonTextField(
      {required this.controller,
      this.isPassword = false,
      this.enabled = true,
      required this.labelText,
      this.onValidate,
      this.prefix,
      this.onChange,
      this.onIconTap,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: AppTheme.mainAccent,
          height: SizeConfig.height * 6,
          child: Center(
            child: TextFormField(
              enabled: enabled,
              controller: controller,
              obscureText:
                  isPassword ? !isShowPassword.value : isShowPassword.value,
              keyboardType: keyboardType,
              onChanged: onChange,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(
                color: Colors.black,
              ),
              cursorColor: AppTheme.accentColor,
              decoration: InputDecoration(
                  hintText: labelText,
                  fillColor: AppTheme.mainAccent,
                  prefixIcon: prefix,
                  filled: true,
                  suffixIcon: !isPassword
                      ? const SizedBox.shrink()
                      : IconButton(
                          onPressed: () {
                            isShowPassword.value = !isShowPassword.value;
                          },
                          icon: Icon(
                            isShowPassword.value
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            color: AppTheme.accentColor,
                          ),
                        ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  suffixIconColor: AppTheme.accentColor,
                  iconColor: AppTheme.accentColor,
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  errorStyle: TextStyle(color: AppTheme.secondColor)),
              validator: onValidate,
            ),
          ),
        ));
  }
}
