import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/doctor_controller.dart';
import '../../widgets/doctor_card.dart';
import '../../routes/app_routes.dart';

class DoctorsListView extends StatelessWidget {
  final DoctorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('doctors'.tr), centerTitle: true),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            final doctor = controller.doctors[index];
            return DoctorCard(
              doctor: doctor,
              onBookPressed: () => Get.toNamed(AppRoutes.BOOK_APPOINTMENT, arguments: doctor),
            );
          },
        ),
      ),
    );
  }
}