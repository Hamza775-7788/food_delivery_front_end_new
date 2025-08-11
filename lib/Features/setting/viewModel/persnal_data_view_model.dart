import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:food_delivery_front_end/core/model/userModel.dart';
import 'package:get/get.dart';

class PersnalDataViewModel {
  String title = "Persnal Data";

  String fullNameLable = "Full Name";
  String dataOfBarchLable = "Date of birth";
  String genderLable = "Gender";
  String phoneLable = "Phone";
  String emailLable = "Email";
  String saveButton = "Save";

  late TextEditingController fullNameController;
  late TextEditingController dataOfBarthController;
  late TextEditingController genderContoller;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  bool gender = false;
  Profile? get profile => _authControllerImpl.user?.profile;
  AuthControllerImpl _authControllerImpl = Get.find();

  File? get image => _authControllerImpl.image;
  String? url;
  onSave() async {
    if (fullNameController.text.isEmpty) {
    } else {
      Profile _profile = Profile(
        id: 0,
        createdAt: "",
        updatedAt: "updatedAt",
        userId: 0,
        fullName: fullNameController.text,
        gender: gender,
        phone: phoneController.text,
        image: profile?.image,
        birthDay: dataOfBarthController.text,
      );
      await _authControllerImpl.setProfle(profile: _profile);
    }
  }

  onSelectImage() {
    _authControllerImpl.selectFile();
  }

  onUpdate() async {
    if (fullNameController.text.isEmpty) {
    } else {
      Profile _profile = Profile(
        id: 0,
        createdAt: "",
        updatedAt: "updatedAt",
        userId: 0,
        fullName: fullNameController.text,
        gender: gender,
        phone: phoneController.text,
        image: profile?.image,
        birthDay: dataOfBarthController.text,
      );
      await _authControllerImpl.updateProfile(profile: _profile);
    }
  }

  setData() {
    emailController.text = _authControllerImpl.user?.email ?? "";
    fullNameController.text = profile?.fullName ?? "";
    phoneController.text = profile?.phone ?? "";
    dataOfBarthController.text = profile?.birthDay ?? "";
    gender = profile?.gender ?? false;
  }
}
