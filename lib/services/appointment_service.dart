import '../models/appointment_model.dart';
import '../hive_boxes/appointments_box.dart';

class AppointmentService {
  void bookAppointment(AppointmentModel appointment) {
    AppointmentsBox.box.add(appointment);
  }

  List<AppointmentModel> getAppointments() {
    return AppointmentsBox.box.values.toList();
  }
}