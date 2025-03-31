import '../models/doctor_model.dart';
import '../hive_boxes/doctors_box.dart';

class DoctorService {
  List<DoctorModel> getDoctors() {
    return DoctorsBox.box.values.toList();
  }
}