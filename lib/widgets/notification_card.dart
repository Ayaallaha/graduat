import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(notification.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body),
            Text(notification.timestamp),
          ],
        ),
      ),
    );
  }
}