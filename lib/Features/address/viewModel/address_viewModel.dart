import 'package:food_delivery_front_end/Features/address/controller/address_controller.dart';
import 'package:food_delivery_front_end/Features/address/view/add_or_update_address_view.dart';
import 'package:food_delivery_front_end/core/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewModel {
  String title = "My Address";

  AddressControllerImpl _controllerImpl = Get.put(AddressControllerImpl());
  AddressViewModel() {
    _controllerImpl.getAddress();
  }
  List<AddressModel> get address => _controllerImpl.address;

  onDelete(int id) {
    _controllerImpl.deleteAddress(id: id);
  }

  onActive(int id) {
    _controllerImpl.activeAddress(id: id);
  }

  onAdd() {
    Get.dialog(AddOrUpdateAddressView());
  }

  onEdit({required AddressModel address}) {
    Get.dialog(AddOrUpdateAddressView(addressModel: address));
  }
}
