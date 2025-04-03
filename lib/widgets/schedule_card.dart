import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/appointment_controller.dart';
import '../../models/doctor_model.dart';
import '../../routes/app_routes.dart';

class ScheduleCard extends StatefulWidget {
  final String day;
  final DoctorModel doctor;

  ScheduleCard({required this.day, required this.doctor});

  @override
  _ScheduleCardState createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentController>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Color(0xff2A629A),
              ),
              onPressed: () => setState(() => isExpanded = !isExpanded),
            ),
            title: Center(
              child: Text(
                widget.day,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Color(0xff2A629A)),
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(36, (index) {
                  final hour = 8 + (index ~/ 2);
                  final minute = index % 2 == 0 ? '00' : '30';
                  final time = 'ص $hour:$minute';
                  final isBooked = controller.appointments.any((a) => a.time == time && a.date == widget.day);
                  final isSelected = controller.selectedTime.value == time;

                  return GestureDetector(
                    onTap: () {
                      if (!isBooked) {
                        controller.selectTime(time);
                        Get.toNamed(
                          AppRoutes.BOOKING_CONFIRMATION,
                          arguments: {'doctor': widget.doctor, 'time': time, 'date': widget.day},
                        );
                      }
                    },
                    child: Container(
                      height: 35,  // تعديل الارتفاع هنا
                      width: 75,   // تعديل العرض هنا
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isBooked
                            ? Colors.grey[300]
                            : (isSelected ? Colors.green : Color(0xff2A629A)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
