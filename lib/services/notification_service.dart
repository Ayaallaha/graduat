import '../models/notification_model.dart';
import '../hive_boxes/notifications_box.dart';

class NotificationService {
  void addNotification(NotificationModel notification) {
    NotificationsBox.addNotification(notification);
  }

  List<NotificationModel> getNotifications() {
    return NotificationsBox.getNotifications();
  }
}