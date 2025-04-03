import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notification_controller.dart';
import '../../widgets/notification_card.dart';

class NotificationsView extends StatelessWidget {
  final NotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Color(0xff2A629A),title: Text('notifications'.tr,style: TextStyle(color: Colors.white),), centerTitle: true, leading: IconButton(
        icon: Icon(Icons.arrow_back ,color: Colors.white,),
        onPressed: () => Get.back(),
      ),),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) => NotificationCard(notification: controller.notifications[index]),
        ),
      ),
    );
  }
}