import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/setting/viewModel/persnal_data_view_model.dart';
import 'package:food_delivery_front_end/Features/setting/widget/profile_image_widget.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';

class PersnalDataView extends StatefulWidget {
  const PersnalDataView({super.key});

  @override
  State<PersnalDataView> createState() => _PersnalDataViewState();
}

class _PersnalDataViewState extends State<PersnalDataView> {
  PersnalDataViewModel viewModel = PersnalDataViewModel();

  @override
  void initState() {
    viewModel.fullNameController = TextEditingController();
    viewModel.dataOfBarthController = TextEditingController();
    viewModel.phoneController = TextEditingController();
    viewModel.emailController = TextEditingController();
    viewModel.genderContoller = TextEditingController();
    viewModel.setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Column(children: [MyProfileImage()])),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.fullNameController,
                hint: "",
                lable: viewModel.fullNameLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.dataOfBarthController,
                hint: "",
                lable: viewModel.dataOfBarchLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyGenderDrobDownWithLable(
                onChanged: (value) {
                  viewModel.gender = value;
                },
                value: viewModel.gender,
                lable: viewModel.genderLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                controller: viewModel.phoneController,
                hint: "",
                lable: viewModel.phoneLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyTextFieldWithLable(
                enable: false,
                controller: viewModel.emailController,
                hint: "",
                lable: viewModel.emailLable,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: MyGenralButton(
                onPressed: () {
                  if (viewModel.profile != null) {
                    viewModel.onUpdate();
                  } else {
                    viewModel.onSave();
                  }
                },
                name: viewModel.saveButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
