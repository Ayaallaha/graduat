import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/appointment_controller.dart';
import '../../widgets/appointment_card.dart';

class MyAppointmentsView extends StatelessWidget {
  final AppointmentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appointments'.tr), centerTitle: true),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.appointments.length,
          itemBuilder: (context, index) => AppointmentCard(appointment: controller.appointments[index]),
        ),
      ),
    );
  }
}