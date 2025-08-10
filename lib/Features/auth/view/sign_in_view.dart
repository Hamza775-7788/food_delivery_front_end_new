import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/auth/viewModel/sign_in_viewModel.dart';
import 'package:food_delivery_front_end/core/constant/image.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/shared/text_field_widget.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SignInViewmodel viewmodel = SignInViewmodel();

  @override
  void initState() {
    viewmodel.emailController = TextEditingController();
    viewmodel.passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    viewmodel.emailController.dispose();
    viewmodel.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: Text(viewmodel.title, style: AppStyles.bigTitle()),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Text(viewmodel.subTitle, style: AppStyles.subTitle()),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: MyTextFieldWithLable(
                  controller: viewmodel.emailController,
                  hint: viewmodel.emailHint,
                  lable: viewmodel.emailLable,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(
                child: MyTextFieldWithLable(
                  isPassowrd: true,
                  controller: viewmodel.passwordController,
                  hint: viewmodel.passwordHint,
                  lable: viewmodel.passwordLable,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),

              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        viewmodel.onForgot();
                      },
                      child: Text(
                        viewmodel.fotgotLable,
                        style: AppStyles.normalStyleTitle(),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: MyGenralButton(
                  name: viewmodel.signInLable,
                  onPressed: () {
                    viewmodel.onSignIn();
                  },
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Get.theme.colorScheme.secondary,
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(viewmodel.orLable, style: AppStyles.subTitle()),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        color: Get.theme.colorScheme.secondary,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),

              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCirclerButton(
                      icon: Image.asset(AppIcons.googleIcon, fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                    SizedBox(width: 16),
                    MyCirclerButton(
                      icon: Image.asset(AppIcons.fBookIcon, fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                    SizedBox(width: 16),
                    MyCirclerButton(
                      icon: Image.asset(AppIcons.applIcon, fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewmodel.dontRegestr,
                      style: AppStyles.normalStyleTitle(),
                    ),
                    TextButton(
                      onPressed: () {
                        viewmodel.onSignUp();
                      },
                      child: Text(viewmodel.signUpLable),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCirclerButton extends StatelessWidget {
  final Widget icon;
  final Function onPressed;
  const MyCirclerButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(2),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Get.theme.colorScheme.secondary),
        ),
        child: icon,
      ),
    );
  }
}
