import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

class MyAddressDropDownList extends StatefulWidget {
  final Function(String?) onChanged;
  final String hint;

  const MyAddressDropDownList({
    required this.onChanged,
    required this.hint,
    super.key,
  });

  @override
  State<MyAddressDropDownList> createState() => _MyAddressDropDownListState();
}

class _MyAddressDropDownListState extends State<MyAddressDropDownList> {
  @override
  void initState() {
    super.initState();
    // items =
    //     widget.data
    //         .map<DropdownMenuItem<CategoryOrUnit>>(
    //           (e) => DropdownMenuItem(value: e, child: Text(e.name)),
    //         )
    //         .toList();

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
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
      items:
          addressControllerImpl.address
              .map<DropdownMenuItem<String>>(
                (e) =>
                    DropdownMenuItem(value: e.address, child: Text(e.address)),
              )
              .toList(),

      onChanged: widget.onChanged,
      value: addressControllerImpl.address.first.address,
    );
  }
}
