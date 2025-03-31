import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/appointment_controller.dart';
import '../../models/doctor_model.dart';

class BookingConfirmationView extends StatelessWidget {
  final DoctorModel doctor = Get.arguments['doctor'];
  final String time = Get.arguments['time'];
  final String date = Get.arguments['date'];
  final AppointmentController controller = Get.find();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final RxBool isProxyBooking = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('تأكيد الحجز'.tr),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://placehold.co/100x100'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      doctor.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    Text(
                      doctor.specialty,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.grey[400]),
                        VerticalDivider(
                          color: Colors.grey[300],
                          thickness: 1,
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                    () => Row(
                                  children: [
                                    Checkbox(
                                      value: isProxyBooking.value,
                                      onChanged: (value) => isProxyBooking.value = value!,
                                    ),
                                    Text(
                                      'أنا أقوم بالحجز نيابة عن مريض آخر',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              TextField(
                                controller: patientNameController,
                                decoration: InputDecoration(
                                  labelText: 'اسم المريض',
                                  labelStyle: TextStyle(color: Colors.grey[700]),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              SizedBox(height: 8),
                              TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: 'رقم الهاتف'.tr,
                                  labelStyle: TextStyle(color: Colors.grey[700]),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text('+', style: TextStyle(color: Colors.grey[700])),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.grey[400]),
                        VerticalDivider(
                          color: Colors.grey[300],
                          thickness: 1,
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(time, style: TextStyle(color: Colors.grey[700])),
                            Text(date, style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (patientNameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                    controller.bookAppointment(
                      doctor.name,
                      doctor.specialty,
                      time,
                      date,
                      patientNameController.text,
                      phoneController.text,
                    );
                    Get.snackbar('تم الحجز', 'تم إضافة موعدك إلى قائمة المواعيد');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  'تأكيد الحجز'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}