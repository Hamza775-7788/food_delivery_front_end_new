import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/controller/auth_controller.dart';
import 'package:food_delivery_front_end/Features/setting/viewModel/setting_view_model.dart';
import 'package:food_delivery_front_end/Features/setting/widget/profile_info_widget.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  SettingViewModel viewModel = SettingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            // ============= profile ==============
            SliverToBoxAdapter(child: ProfileInfoWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: Divider(color: Color(0xffEDEDED))),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(viewModel.profileTitle, style: AppStyles.subTitle()),
            ),
            SliverList.builder(
              itemCount: viewModel.prfileList.length,
              itemBuilder: (context, index) {
                final item = viewModel.prfileList[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  onTap: item.onTap,
                  leading: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF5F5FF),
                    ),

                    child: item.icon,
                  ),
                  title: Text(item.name, style: AppStyles.normalStyleTitle()),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Text(viewModel.supportTitle, style: AppStyles.subTitle()),
            ),
            SliverList.builder(
              itemCount: viewModel.supportList.length,
              itemBuilder: (context, index) {
                final item = viewModel.supportList[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  onTap: item.onTap,
                  leading: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF5F5FF),
                    ),

                    child: item.icon,
                  ),
                  title: Text(item.name, style: AppStyles.normalStyleTitle()),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
            SliverToBoxAdapter(child: Divider(color: Color(0xffEDEDED))),
            // SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                onTap: viewModel.onSignOut,

                title: Text(viewModel.signOutLable),
                leading: Icon(Icons.exit_to_app_outlined, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


