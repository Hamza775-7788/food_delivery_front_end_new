import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/address/viewModel/add_or_update_address_view_model.dart';
import 'package:food_delivery_front_end/core/model/address_model.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';
import 'package:get/get.dart';

class AddOrUpdateAddressView extends StatefulWidget {
  final AddressModel? addressModel;

  const AddOrUpdateAddressView({this.addressModel, super.key});

  @override
  State<AddOrUpdateAddressView> createState() => _AddOrUpdateAddressViewState();
}

class _AddOrUpdateAddressViewState extends State<AddOrUpdateAddressView> {
  AddOrUpdateAddressViewModel viewModel = AddOrUpdateAddressViewModel();

  @override
  void initState() {
    viewModel.addressController = TextEditingController();
    viewModel.titleController = TextEditingController();

    if (widget.addressModel != null) {
      viewModel.addressController.text = widget.addressModel?.address ?? "";
      viewModel.titleController.text = widget.addressModel?.title ?? "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextFieldWithLable(
              controller: viewModel.titleController,
              hint: "",
              lable: viewModel.titleLabel,
            ),
            MyTextFieldWithLable(
              maxLine: 5,
              controller: viewModel.addressController,
              hint: "",
              lable: viewModel.addressLable,
            ),
            const SizedBox(height: 16),
            MyGenralButton(
              onPressed: () {
                if (widget.addressModel != null) {
                  viewModel.onUpdate(widget.addressModel!);
                } else {
                  viewModel.onAdd();
                }
              },
              name: viewModel.saveLable,
            ),
          ],
        ),
      ),
    );
  }
}
