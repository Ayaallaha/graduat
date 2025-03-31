import 'package:hive/hive.dart';
import '../models/appointment_model.dart';

class AppointmentsBox {
  static Box<AppointmentModel>? _box;

  static Future<void> init() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<AppointmentModel>('appointments');
    }
  }

  static Box<AppointmentModel> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('AppointmentsBox has not been initialized. Call init() first.');
    }
    return _box!;
  }

  static void addAppointment(AppointmentModel appointment) => box.add(appointment);
  static List<AppointmentModel> getAppointments() => box.values.toList();
}