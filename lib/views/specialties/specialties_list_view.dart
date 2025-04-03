import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/specialties_controller.dart';
import '../../routes/app_routes.dart';

class SpecialtiesListView extends StatelessWidget {
  final SpecialtiesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back ,color: Colors.white,),
            onPressed: () => Get.back(),
          ),
        backgroundColor: Color(0xff2A629A),
        title: Text('specialties'.tr),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'إبحث عن التخصص الذي تحتاجه في مستشفانا',
                  labelStyle: TextStyle(color: Color(0xff7F7F7F)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff858585)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff2A629A), width: 1.5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.specialties.length,
                  itemBuilder: (context, index) {
                    final specialty = controller.specialties[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.medical_services_outlined, color: Color(0xff2A629A)),
                          title: Text(
                            specialty,
                            style: TextStyle(color: Color(0xff2A629A)),
                          ),
                          onTap: () => Get.toNamed(AppRoutes.DOCTORS_BY_SPECIALTY, arguments: specialty),
                        ),
                        Divider(
                          color: Color(0xff7F7F7F),
                          thickness: 0.5,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
