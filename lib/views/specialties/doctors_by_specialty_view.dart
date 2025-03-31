import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/doctor_controller.dart';
import '../../widgets/doctor_card.dart';
import '../../routes/app_routes.dart';

class DoctorsBySpecialtyView extends StatelessWidget {
  final DoctorController controller = Get.find();
  final String specialty = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final doctors = controller.doctors.where((d) => d.specialty == specialty).toList();
    return Scaffold(
      appBar: AppBar(title: Text(specialty), centerTitle: true),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorCard(
            doctor: doctor,
            onBookPressed: () => Get.toNamed(AppRoutes.BOOK_APPOINTMENT, arguments: doctor),
          );
        },
      ),
    );
  }
}