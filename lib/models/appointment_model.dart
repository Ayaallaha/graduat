import 'package:hive/hive.dart';
part 'appointment_model.g.dart';

@HiveType(typeId: 2)
class AppointmentModel {
  @HiveField(0)
  final String doctorName;

  @HiveField(1)
  final String specialty;

  @HiveField(2)
  final String time;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String patientName;

  @HiveField(5)
  final String phone;

  AppointmentModel({
    required this.doctorName,
    required this.specialty,
    required this.time,
    required this.date,
    required this.patientName,
    required this.phone,
  });
}