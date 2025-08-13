import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/address/controller/address_controller.dart';
import 'package:food_delivery_front_end/core/model/address_model.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';

class AddOrUpdateAddressViewModel {
  AddressControllerImpl _controllerImpl = Get.put(AddressControllerImpl());

  String titleLabel = "Title";
  String addressLable = "Address";
  String saveLable = "Save";

  late TextEditingController titleController;
  late TextEditingController addressController;

  onAdd() {
    if (titleController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "title Required"));
    } else if (addressController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "address Required"));
    } else {
      AddressModel addressModel = AddressModel(
        id: 0,
        address: addressController.text,
        title: titleController.text,
        active: false,
        userId: 0,
        createdAt: " createdAt",
        updatedAt: "updatedAt",
      );

      _controllerImpl.storeAddress(address: addressModel);
    }
  }

  onUpdate(AddressModel address) {
    if (titleController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "title Required"));
    } else if (addressController.text.isEmpty) {
      Get.dialog(ErrorDialog(message: "address Required"));
    } else {
      AddressModel addressModel = AddressModel(
        id: address.id,
        address: addressController.text,
        title: titleController.text,
        active: address.active,
        userId: address.userId,
        createdAt: address.createdAt,
        updatedAt: address.updatedAt,
      );

      _controllerImpl.updateAddress(address: addressModel);
    }
  }
}
