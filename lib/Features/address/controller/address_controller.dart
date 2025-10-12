import 'package:food_delivery_front_end/Features/address/repository/address_repository.dart';
import 'package:food_delivery_front_end/core/erorrs/handle_message.dart';
import 'package:food_delivery_front_end/core/model/address_model.dart';
import 'package:food_delivery_front_end/core/shared/dialogs.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {
  Future<void> getAddress();
  Future<void> storeAddress({required AddressModel address});
  Future<void> updateAddress({required AddressModel address});
  Future<void> deleteAddress({required int id});
  Future<void> activeAddress({required int id});
}

class AddressControllerImpl extends AddressController {
  final AddressRepository repository = AddressRepositoryImpl();

  List<AddressModel> address = [ ] ;

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  @override
  Future<void> activeAddress({required int id}) async {
    lodingDialog();
    final request = await repository.activeAddress(id: id);
    Get.back();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        handleSuccess();
        getAddress();
      },
    );
  }

  @override
  Future<void> deleteAddress({required int id}) async {
    lodingDialog();
    final request = await repository.deleteAddress(id: id);
    Get.back();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        handleSuccess();
        getAddress();
      },
    );
  }

  @override
  Future<void> getAddress() async {
    final request = await repository.getAddress();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (remoteAddress) {
        address = remoteAddress;
        update();
      },
    );
  }

  @override
  Future<void> storeAddress({required AddressModel address}) async {
    lodingDialog();
    final request = await repository.storeAddress(address: address);
    Get.back();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        Get.back();

        handleSuccess();
        getAddress();
      },
    );
  }

  @override
  Future<void> updateAddress({required AddressModel address}) async {
    lodingDialog();
    final request = await repository.updateAddress(address: address);
    Get.back();
    request.fold(
      (failure) {
        handleErorr(failure);
      },
      (_) {
        Get.back();
        handleSuccess();
        getAddress();
      },
    );
  }
}
