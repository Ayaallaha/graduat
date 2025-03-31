import 'package:get/get.dart';
import '../models/doctor_model.dart';
import '../services/doctor_service.dart';

class DoctorController extends GetxController {
  var doctors = <DoctorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    doctors.value = DoctorService().getDoctors();
  }
}