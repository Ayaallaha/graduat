import 'package:flutter/material.dart';
import '../models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback onBookPressed;

  DoctorCard({required this.doctor, required this.onBookPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Container(
        decoration: BoxDecoration(color: Colors.white),
        child:Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(63),
                  child: Image.asset(
                    'assets/doctor_photo.jpeg',
                    width: 126,
                    height: 126,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
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
                    child: Text('حجز',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(

                      minimumSize: Size((MediaQuery.of(context).size.width - 36) / 2 - 1.5, 36),
                      backgroundColor: Color(0xff72C1BC)

                    ),
                  ),
                  SizedBox(width: 3),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(8),
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
      ), )
    );
  }
}