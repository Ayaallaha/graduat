import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/review_controller.dart';
import '../../widgets/appointment_card.dart';
import '../../models/appointment_model.dart';

class ReviewAppointmentsView extends StatelessWidget {
  final ReviewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Color(0xff2A629A),title: Text('reviews'.tr,style: TextStyle(color:Colors.white, )), centerTitle: true),
      body: Obx(
            () => ListView.builder(
          itemCount: controller.reviews.length,
          itemBuilder: (context, index) {
            final review = controller.reviews[index];
            return AppointmentCard(
              appointment: AppointmentModel(
                doctorName: review.doctorName,
                specialty: '',
                time: review.time,
                date: review.date,
                patientName: '',
                phone: '',
              ),
            );
          },
        ),
      ),
    );
  }
}