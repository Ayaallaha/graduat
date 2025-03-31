import 'package:hive/hive.dart';
import '../models/user_model.dart';

class UsersBox {
  static Box<UserModel>? _box;

  static Future<void> init() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<UserModel>('users');
    }
  }

  static Box<UserModel> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('UsersBox has not been initialized. Call init() first.');
    }
    return _box!;
  }

  static void addUser(UserModel user) => box.put(user.email, user);
  static UserModel? getUser(String email) => box.get(email);
}