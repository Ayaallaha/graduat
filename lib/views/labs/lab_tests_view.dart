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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff2A629A),
        title: Text(
          'lab_tests'.tr,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back ,color: Colors.white,),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'إبحث عن الشعاع او التحليل  الذي تحتاجه في مستشفانا',
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
                  itemCount: controller.labTests.length,
                  itemBuilder: (context, index) {
                    final test = controller.labTests[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.health_and_safety_outlined,color: Color(0xff2A629A),),
                          title: Text(test,style: TextStyle(color: Color(0xff2A629A)),),
                          onTap: () => Get.toNamed(
                            AppRoutes.BOOK_APPOINTMENT,
                            arguments: DoctorModel(
                              name: 'مشفى الحياة',
                              specialty: test,
                              workingHours: '8:00-20:00',
                              rating: 4.0,
                            ),
                          ),
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
