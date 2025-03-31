import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/specialties_controller.dart';
import '../../routes/app_routes.dart';

class SpecialtiesListView extends StatelessWidget {
  final SpecialtiesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('specialties'.tr), centerTitle: true),
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
                itemCount: controller.specialties.length,
                itemBuilder: (context, index) {
                  final specialty = controller.specialties[index];
                  return ListTile(
                    leading: Icon(Icons.medical_services),
                    title: Text(specialty),
                    onTap: () => Get.toNamed(AppRoutes.DOCTORS_BY_SPECIALTY, arguments: specialty),
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