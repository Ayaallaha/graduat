import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/doctor_model.dart';
import '../../routes/app_routes.dart';

class DoctorDetailsView extends StatelessWidget {
  final DoctorModel doctor = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doctor.name), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage('assets/doctor_photo.jpeg')),
            SizedBox(height: 16),
            Text(doctor.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(doctor.specialty),
            Text('ساعات العمل: ${doctor.workingHours}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (i) => Icon(
                  Icons.star,
                  color: i < doctor.rating.floor() ? Colors.yellow : Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.BOOK_APPOINTMENT, arguments: doctor),
              child: Text('book_appointment'.tr),
            ),
          ],
        ),
      ),
    );
  }
}