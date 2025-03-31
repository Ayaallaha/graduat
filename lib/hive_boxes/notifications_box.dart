import 'package:hive/hive.dart';
import '../models/notification_model.dart';

class NotificationsBox {
  static Box<NotificationModel>? _box;

  static Future<void> init() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<NotificationModel>('notifications');
    }
  }

  static Box<NotificationModel> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('NotificationsBox has not been initialized. Call init() first.');
    }
    return _box!;
  }

  static void addNotification(NotificationModel notification) => box.add(notification);
  static List<NotificationModel> getNotifications() => box.values.toList();
}