import 'package:hive/hive.dart';
import '../models/review_model.dart';

class ReviewsBox {
  static Box<ReviewModel>? _box;

  static Future<void> init() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<ReviewModel>('reviews');
    }
  }

  static Box<ReviewModel> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('ReviewsBox has not been initialized. Call init() first.');
    }
    return _box!;
  }

  static void addReview(ReviewModel review) => box.add(review);
  static List<ReviewModel> getReviews() => box.values.toList();
}