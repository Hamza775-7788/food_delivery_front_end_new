import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassowrd;
  final int maxLine;
  const MyTextField({
    this.maxLine = 1,
    this.isPassowrd = false,
    required this.controller,
    required this.hint,
    super.key,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      // maxLines: widget.maxLine,
      minLines: 1,
      obscureText: widget.isPassowrd ? showPassword : false,
      controller: widget.controller,
      style: AppStyles.normalStyleTitle(),
      decoration: InputDecoration(
        suffixIcon:
            widget.isPassowrd
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon:
                      showPassword
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.remove_red_eye_outlined),
                )
                : null,

        hintStyle: AppStyles.subTitle(),
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Get.theme.colorScheme.primary),
        ),
      ),
    );
  }
}

class MyTextFieldWithLable extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String lable;
  final bool isPassowrd;
  final int maxLine;
  const MyTextFieldWithLable({
    this.maxLine = 1,
    super.key,
    this.isPassowrd = false,
    required this.controller,
    required this.hint,
    required this.lable,
  });

  @override
  State<MyTextFieldWithLable> createState() => _MyTextFieldWithLableState();
}

class _MyTextFieldWithLableState extends State<MyTextFieldWithLable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.lable, style: AppStyles.normalStyleTitle()),
        SizedBox(height: 10),
        MyTextField(
          maxLine: widget.maxLine,
          isPassowrd: widget.isPassowrd,
          controller: widget.controller,
          hint: widget.hint,
        ),
      ],
    );
  }
}
