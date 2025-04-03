import 'package:flutter/material.dart';
import '../models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xffEBF2FA),child: Card(
      child: ListTile(
        leading: CircleAvatar(radius: 20, backgroundImage: NetworkImage('assets/doctor_photo.jpeg')),
        title: Text('لديك مراجعة ${review.date}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.time),
            Text(review.date),
            Text(review.doctorName),
          ],
        ),
      ),
    ),);
  }
}