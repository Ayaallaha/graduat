import 'package:hive/hive.dart';
part 'review_model.g.dart';

@HiveType(typeId: 3)
class ReviewModel {
  @HiveField(0)
  final String doctorName;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final String time;

  ReviewModel({
    required this.doctorName,
    required this.date,
    required this.time,
  });
}