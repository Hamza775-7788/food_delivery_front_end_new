import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassowrd;
  final int maxLine;
  final bool? enable;
  const MyTextField({
    this.maxLine = 1,
    this.isPassowrd = false,
    required this.controller,
    required this.hint,
    this.enable,
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
      enabled: widget.enable,
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
        disabledBorder: OutlineInputBorder(
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
  final bool? enable;
  const MyTextFieldWithLable({
    this.maxLine = 1,
    this.enable,
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
          enable: widget.enable,
          maxLine: widget.maxLine,
          isPassowrd: widget.isPassowrd,
          controller: widget.controller,
          hint: widget.hint,
        ),
      ],
    );
  }
}

class MyGenderDrobDownWithLable extends StatefulWidget {
  final String lable;
  final bool? value;
  final void Function(bool) onChanged;

  const MyGenderDrobDownWithLable({
    required this.onChanged,
    this.value,
    super.key,
    required this.lable,
  });

  @override
  State<MyGenderDrobDownWithLable> createState() =>
      _MyGenderDrobDownWithLableState();
}

class _MyGenderDrobDownWithLableState extends State<MyGenderDrobDownWithLable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.lable, style: AppStyles.normalStyleTitle()),
        SizedBox(height: 10),
        DropdownButtonFormField(
          decoration: InputDecoration(
            hintStyle: AppStyles.subTitle(),

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
          value: widget.value,
          items: [
            DropdownMenuItem(child: Text("Male"), value: false),
            DropdownMenuItem(child: Text("Female"), value: true),
          ],
          onChanged: (vlaue) {
            widget.onChanged(vlaue!);
          },
        ),
      ],
    );
  }
}
