import 'package:get/get.dart';
import '../models/user_model.dart';
import '../controllers/auth_controller.dart';

class ProfileController extends GetxController {
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();

    ever(Get.find<AuthController>().currentUser, (UserModel? newUser) {
      user.value = newUser;
    });
    user.value = Get.find<AuthController>().currentUser.value;
  }

  void updateUser(String name, String phone, String email, String password, String dob) {
    Get.find<AuthController>().updateProfile(name, phone, email, password, dob);
    user.value = Get.find<AuthController>().currentUser.value;
  }
}