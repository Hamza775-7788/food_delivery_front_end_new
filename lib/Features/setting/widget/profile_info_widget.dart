import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:food_delivery_front_end/Features/setting/widget/profile_image_widget.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControllerImpl>(
      builder: (controller) {
        return Column(
          children: [
            MyProfileImage(),
            SizedBox(height: 16),
            Text(
              controller.user?.name ?? "",
              style: AppStyles.normalStyleTitleBold(),
            ),
            Text(
              controller.user?.email ?? "",
              style: AppStyles.normalStyleTitle(),
            ),
          ],
        );
      },
    );
  }
}
