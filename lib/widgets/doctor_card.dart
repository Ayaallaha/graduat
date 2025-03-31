import 'package:flutter/material.dart';
import '../models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onBookPressed;

  DoctorCard({required this.doctor, required this.onBookPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/doctor_photo.jpeg'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor.name, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(doctor.specialty),
                      Row(
                        children: List.generate(
                          5,
                              (i) => Icon(
                            Icons.star,
                            size: 16,
                            color: i < doctor.rating.floor() ? Colors.yellow : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: onBookPressed,
                    child: Text('حجز'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size((MediaQuery.of(context).size.width - 36) / 2 - 1.5, 36),
                    ),
                  ),
                  SizedBox(width: 3),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    constraints: BoxConstraints(
                      minWidth: (MediaQuery.of(context).size.width - 36) / 2 - 1.5,
                    ),
                    child: Text(doctor.workingHours, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}