import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SettingViewModel {
  String title = "Profile & Settings";

  String profileTitle = "Profile";
  String supportTitle = "Support";
  SettingViewModel() {
    _controllerImpl.getUserData();
  }
  AuthControllerImpl _controllerImpl = Get.put(AuthControllerImpl());
  List<SettingModel> get prfileList {
    return [
      SettingModel(
        icon: Icon(Icons.person),
        name: "Personal Data",
        onTap: () {},
      ),
      SettingModel(icon: Icon(Icons.payment), name: "My Orders", onTap: () {}),
      SettingModel(
        icon: Icon(Icons.notifications_outlined),
        name: "Notifications",
        onTap: () {},
      ),
      SettingModel(
        icon: Icon(Icons.settings_outlined),
        name: "Settings",
        onTap: () {},
      ),
    ];
  }

  List<SettingModel> get supportList {
    return [
      SettingModel(
        icon: Icon(Icons.help_outline_outlined),
        name: "Help Center",
        onTap: () {},
      ),
      SettingModel(
        icon: Icon(Icons.delete_outline_outlined),
        name: "Request Account Deletion",
        onTap: () {},
      ),
      SettingModel(
        icon: Icon(Icons.person_add),
        name: "Add another account",
        onTap: () {},
      ),
    ];
  }

  String signOutLable = "Sign Out";
  onSignOut() {}
}

class SettingModel {
  final Widget icon;
  final String name;
  final Function() onTap;

  SettingModel({required this.icon, required this.name, required this.onTap});
}


// F5F5FF