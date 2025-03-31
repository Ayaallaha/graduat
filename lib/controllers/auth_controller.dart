import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  var currentUser = Rxn<UserModel>();

  void signup(String name, String phone, String email, String password, String dob) {
    var user = UserModel(name: name, phone: phone, email: email, password: password, dob: dob);
    AuthService().signup(user);
    currentUser.value = user;
    Get.offAllNamed(AppRoutes.HOME);
  }

  void login(String email, String password) {
    var user = AuthService().login(email, password);
    if (user != null) {
      currentUser.value = user;
      Get.offAllNamed(AppRoutes.HOME);
    }
  }

  void updateProfile(String name, String phone, String email, String password, String dob) {
    var updatedUser = UserModel(name: name, phone: phone, email: email, password: password, dob: dob);
    AuthService().updateProfile(updatedUser);
    currentUser.value = updatedUser;
    Get.back();
  }

  void logout() {
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}