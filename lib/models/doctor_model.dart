import 'package:hive/hive.dart';
part 'doctor_model.g.dart';

@HiveType(typeId: 0)
class DoctorModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String specialty;

  @HiveField(2)
  final String workingHours;

  @HiveField(3)
  final double rating;

  DoctorModel({
    required this.name,
    required this.specialty,
    required this.workingHours,
    required this.rating,
  });
}