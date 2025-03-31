import '../models/review_model.dart';
import '../hive_boxes/reviews_box.dart';

class ReviewService {
  void addReview(ReviewModel review) {
    ReviewsBox.box.add(review);
  }

  List<ReviewModel> getReviews() {
    return ReviewsBox.box.values.toList();
  }
}