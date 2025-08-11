import 'dart:io';

import 'package:food_delivery_front_end/Features/Main/MainViewPage.dart';
import 'package:food_delivery_front_end/Features/auth/view/sign_in_view.dart';
import 'package:food_delivery_front_end/Features/auth/repository/auth_repository.dart';
import 'package:food_delivery_front_end/Features/auth/view/emial_verifiyCodeViewPage.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/userModel.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AuthController extends GetxController {
  Future<void> signIn({required String email, required String passowrd});
  Future<void> signUp({
    required String email,
    required String passowrd,
    required String userName,
  });
  Future<void> forgotePassowrd({required String email});
  Future<void> verifiyCode({required String email, required String code});
  Future<void> restPassowrd({required String email, required String passowrd});
  Future<void> getUserData();
  Future<void> splashScreen();
  Future<void> setProfle({required Profile profile});
  Future<void> updateProfile({required Profile profile});
  Future<void> selectFile();
}

class AuthControllerImpl extends AuthController {
  AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();

  File? image;
  UserModel? user;
  @override
  Future<void> forgotePassowrd({required String email}) async {
    try {
      lodingDialog();
      final request = await _authRepositoryImpl.forgotePassowrd(email: email);
      Get.back();

      request.fold(
        (failure) {
          // handle erorr
          handleErorr(failure);
        },
        (_) {
          Get.to(
            () => EmialVerifiycodeviewpage(email: email),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
          );
        },
      );
    } catch (e) {
      Get.back();
    }
  }

  @override
  Future<void> restPassowrd({
    required String email,
    required String passowrd,
  }) async {
    try {
      lodingDialog();
      final request = await _authRepositoryImpl.restPassowrd(
        email: email,
        passowrd: passowrd,
      );
      Get.back();

      request.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
    }
  }

  @override
  Future<void> signIn({required String email, required String passowrd}) async {
    try {
      lodingDialog();
      final request = await _authRepositoryImpl.signIn(
        email: email,
        passowrd: passowrd,
      );
      Get.back();
      request.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          Get.offAll(() => Mainviewpage());
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
    }
  }

  @override
  Future<void> signUp({
    required String email,
    required String passowrd,
    required String userName,
  }) async {
    lodingDialog();

    final request = await _authRepositoryImpl.signUp(
      email: email,
      passowrd: passowrd,
      userName: userName,
    );
    Get.back();
    request.fold(
      (failure) {
        print("$failure");
        handleErorr(failure);
      },
      (_) {
        Get.offAll(() => Mainviewpage());
        handleSuccess();
      },
    );
  }

  @override
  Future<void> verifiyCode({
    required String email,
    required String code,
  }) async {
    try {
      lodingDialog();
      final request = await _authRepositoryImpl.verifiyCode(
        email: email,
        code: code,
      );
      Get.back();
      request.fold(
        (failure) {
          handleErorr(failure);
        },
        (_) {
          handleSuccess();
        },
      );
    } catch (e) {
      Get.back();
    }
  }

  @override
  Future<void> getUserData() async {
    final requset = await _authRepositoryImpl.getUserData();
    requset.fold((failure) {}, (e) {
      user = e;
      update();
    });
  }

  @override
  Future<void> splashScreen() async {
    final requset = await _authRepositoryImpl.getUserData();
    requset.fold(
      (failure) {
        Get.offAll(() => SignInView());
      },
      (e) {
        Get.offAll(() => Mainviewpage());
      },
    );
  }

  @override
  Future<void> setProfle({required Profile profile}) async {
    lodingDialog();
    final requset = await _authRepositoryImpl.setProfile(
      profile: profile,
      image: image,
    );
    Get.back();
    requset.fold(
      (failure) {
        handleErorr(failure);
      },
      (e) {
        getUserData();
      },
    );
  }

  @override
  Future<void> updateProfile({required Profile profile}) async {
    lodingDialog();

    final requset = await _authRepositoryImpl.updateProfile(
      profile: profile,
      image: image,
    );
    Get.back();
    requset.fold(
      (failure) {
        handleErorr(failure);
      },
      (e) {
        getUserData();
      },
    );
  }

  @override
  Future<void> selectFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      image = File(_image.path);
      update();
    } else {}
  }
}
