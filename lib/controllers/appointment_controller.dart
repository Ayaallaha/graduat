import 'package:get/get.dart';
import '../models/appointment_model.dart';
import '../hive_boxes/appointments_box.dart';
import '../services/appointment_service.dart';
import '../controllers/review_controller.dart';
import '../controllers/notification_controller.dart';

class AppointmentController extends GetxController {
  var appointments = <AppointmentModel>[].obs;
  var selectedTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    appointments.value = AppointmentsBox.box.values.toList();
  }

  void bookAppointment(String doctorName, String specialty, String time, String date, String patientName, String phone) {
    final appointment = AppointmentModel(
      doctorName: doctorName,
      specialty: specialty,
      time: time,
      date: date,
      patientName: patientName,
      phone: phone,
    );
    AppointmentService().bookAppointment(appointment);
    appointments.add(appointment);

    if (specialty.contains('أشعة') || specialty.contains('تحليل')) {
      Get.find<ReviewController>().addReview(doctorName, date, time);
    } else {
      Get.find<NotificationController>().addNotification('موعد جديد', 'تم حجز موعد مع $doctorName يوم $date الساعة $time');
    }

    selectedTime.value = '';
    Get.back();
  }

  void selectTime(String time) => selectedTime.value = time;
}