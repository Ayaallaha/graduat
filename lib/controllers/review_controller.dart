import 'package:get/get.dart';
import '../models/review_model.dart';
import '../services/review_service.dart';

class ReviewController extends GetxController {
  var reviews = <ReviewModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    reviews.value = ReviewService().getReviews();
  }

  void addReview(String doctorName, String date, String time) {
    final review = ReviewModel(doctorName: doctorName, date: date, time: time);
    ReviewService().addReview(review);
    reviews.add(review);
  }
}