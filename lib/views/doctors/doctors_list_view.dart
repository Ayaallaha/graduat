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
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:Color(0xff2A629A),title: Text('doctors list'.tr,style: TextStyle(color: Colors.white),), centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back ,color: Colors.white,),
          onPressed: () => Get.back(),
        ),
      ),
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