import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'models/doctor_model.dart';
import 'models/user_model.dart';
import 'models/appointment_model.dart';
import 'models/review_model.dart';
import 'models/notification_model.dart';
import 'hive_boxes/doctors_box.dart';
import 'hive_boxes/users_box.dart';
import 'hive_boxes/appointments_box.dart';
import 'hive_boxes/reviews_box.dart';
import 'hive_boxes/notifications_box.dart';
import 'translations/ar_SY.dart';
import 'translations/en_US.dart';
import 'controllers/auth_controller.dart';
import 'controllers/appointment_controller.dart';
import 'controllers/doctor_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/lab_tests_controller.dart';
import 'controllers/notification_controller.dart';
import 'controllers/profile_controller.dart';
import 'controllers/review_controller.dart';
import 'controllers/specialties_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DoctorModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(AppointmentModelAdapter());
  Hive.registerAdapter(ReviewModelAdapter());
  Hive.registerAdapter(NotificationModelAdapter());
  await DoctorsBox.init();
  await UsersBox.init();
  await AppointmentsBox.init();
  await ReviewsBox.init();
  await NotificationsBox.init();
  Get.put(AuthController());
  Get.put(AppointmentController());
  Get.put(DoctorController());
  Get.put(HomeController());
  Get.put(LabTestsController());
  Get.put(NotificationController());
  Get.put(ProfileController());
  Get.put(ReviewController());
  Get.put(SpecialtiesController());
  runApp(HospitalBookingApp());
}

class HospitalBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'مشفى الحياة',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.routes,
      translations: AppTranslations(),
      locale: Locale('ar', 'SY'),
      fallbackLocale: Locale('en', 'US'),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_SY': arSY,
    'en_US': enUS,
  };
}