import 'package:hive/hive.dart';

class StorageService {
  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  void clearBox(String boxName) async {
    var box = await Hive.openBox(boxName);
    box.clear();
  }
}