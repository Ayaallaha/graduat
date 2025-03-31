import 'package:flutter/material.dart';
import '../models/appointment_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage('https://placehold.co/40x40')),
        title: Text('موعد مع ${appointment.doctorName}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appointment.time),
            Text(appointment.date),
            Text(appointment.specialty),
          ],
        ),
      ),
    );
  }
}