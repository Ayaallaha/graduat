import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/lab_tests_controller.dart';
import '../../models/doctor_model.dart';
import '../../routes/app_routes.dart';

class LabTestsView extends StatelessWidget {
  final LabTestsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('lab_tests'.tr), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(labelText: 'بحث', border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.labTests.length,
                itemBuilder: (context, index) {
                  final test = controller.labTests[index];
                  return ListTile(
                    leading: Icon(Icons.local_hospital),
                    title: Text(test),
                    onTap: () => Get.toNamed(
                      AppRoutes.BOOK_APPOINTMENT,
                      arguments: DoctorModel(
                        name: 'مشفى الحياة',
                        specialty: test,
                        workingHours: '8:00-20:00',
                        rating: 4.0,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}