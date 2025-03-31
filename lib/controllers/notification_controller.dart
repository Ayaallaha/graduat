import 'package:get/get.dart';
import '../models/notification_model.dart';
import '../services/notification_service.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    notifications.value = NotificationService().getNotifications();
  }

  void addNotification(String title, String body) {
    final notification = NotificationModel(title: title, body: body, timestamp: DateTime.now().toString());
    NotificationService().addNotification(notification);
    notifications.add(notification);
  }
}