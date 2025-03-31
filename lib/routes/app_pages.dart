import 'package:get/get.dart';
import '../views/splash/splash_view.dart';
import '../views/auth/login_view.dart';
import '../views/auth/signup_view.dart';
import '../views/home/home_view.dart';
import '../views/appointments/book_appointment_view.dart';
import '../views/appointments/my_appointments_view.dart';
import '../views/appointments/review_appointments_view.dart';
import '../views/doctors/doctors_list_view.dart';
import '../views/doctors/doctor_details_view.dart';
import '../views/specialties/specialties_list_view.dart';
import '../views/specialties/doctors_by_specialty_view.dart';
import '../views/labs/lab_tests_view.dart';
import '../views/notifications/notifications_view.dart';
import '../views/profile/profile_view.dart';
import '../views/profile/edit_profile_view.dart';
import '../views/splash/booking_confirmation_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.SPLASH, page: () => SplashView()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginView()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignupView()),
    GetPage(name: AppRoutes.HOME, page: () => HomeView()),
    GetPage(name: AppRoutes.BOOK_APPOINTMENT, page: () => BookAppointmentView()),
    GetPage(name: AppRoutes.MY_APPOINTMENTS, page: () => MyAppointmentsView()),
    GetPage(name: AppRoutes.REVIEW_APPOINTMENTS, page: () => ReviewAppointmentsView()),
    GetPage(name: AppRoutes.DOCTORS_LIST, page: () => DoctorsListView()),
    GetPage(name: AppRoutes.DOCTOR_DETAILS, page: () => DoctorDetailsView()),
    GetPage(name: AppRoutes.SPECIALTIES_LIST, page: () => SpecialtiesListView()),
    GetPage(name: AppRoutes.DOCTORS_BY_SPECIALTY, page: () => DoctorsBySpecialtyView()),
    GetPage(name: AppRoutes.LAB_TESTS, page: () => LabTestsView()),
    GetPage(name: AppRoutes.NOTIFICATIONS, page: () => NotificationsView()),
    GetPage(name: AppRoutes.PROFILE, page: () => ProfileView()),
    GetPage(name: AppRoutes.EDIT_PROFILE, page: () => EditProfileView()),
    GetPage(name: AppRoutes.BOOKING_CONFIRMATION, page: () => BookingConfirmationView()),
  ];
}