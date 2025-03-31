import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notification_controller.dart';
import '../../widgets/notification_card.dart';

class NotificationsView extends StatelessWidget {
  final NotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('notifications'.tr), centerTitle: true),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) => NotificationCard(notification: controller.notifications[index]),
        ),
      ),
    );
  }
}