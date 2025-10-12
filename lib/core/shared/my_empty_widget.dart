import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/constant/image.dart';

class MyEmptyWidget extends StatelessWidget {
  const MyEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppImage.noData, height: 250));
  }
}
