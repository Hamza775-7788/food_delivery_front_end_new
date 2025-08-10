import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileImage extends StatelessWidget {
  final Widget? icon;
  final Function()? onTap;

  const MyProfileImage({this.icon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF5F5FF),
          ),
          child: Icon(Icons.person, size: 50),
        ),

        Positioned(
          bottom: -10,
          right: -10,
          child: IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.camera_alt_sharp,
              color: Get.theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
