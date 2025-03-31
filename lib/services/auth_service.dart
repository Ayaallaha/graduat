import '../models/user_model.dart';
import '../hive_boxes/users_box.dart';

class AuthService {
  void signup(UserModel user) {
    UsersBox.box.put(user.email, user);
  }

  UserModel? login(String email, String password) {
    var user = UsersBox.box.get(email);
    if (user != null && user.password == password) return user;
    return null;
  }

  void updateProfile(UserModel user) {
    UsersBox.box.put(user.email, user);
  }
}