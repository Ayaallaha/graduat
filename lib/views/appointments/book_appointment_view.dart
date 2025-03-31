import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/appointment_controller.dart';
import '../../models/doctor_model.dart';
import '../../widgets/schedule_card.dart';

class BookAppointmentView extends StatelessWidget {
  final DoctorModel doctor = Get.arguments;
  final AppointmentController controller = Get.find();
  final List<String> days = ['الأحد', 'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حجز موعد مع ${doctor.name}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) => ScheduleCard(day: days[index], doctor: doctor),
      ),
    );
  }
}