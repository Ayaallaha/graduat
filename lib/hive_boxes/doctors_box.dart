import 'package:hive/hive.dart';
import '../models/doctor_model.dart';

class DoctorsBox {
  static Box<DoctorModel>? _box;

  static Future<void> init() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox<DoctorModel>('doctors');
      if (_box!.isEmpty) {
        await _box!.addAll([
          DoctorModel(name: 'محمد الخالد', specialty: 'جراحة قلبية', workingHours: '9:00-17:00', rating: 4.5),
          DoctorModel(name: 'سارة أحمد', specialty: 'أمراض جلدية', workingHours: '10:00-18:00', rating: 4.8),
          DoctorModel(name: 'علي حسن', specialty: 'طب أطفال', workingHours: '8:00-16:00', rating: 4.3),
          DoctorModel(name: 'ليلى خالد', specialty: 'عيون', workingHours: '9:00-15:00', rating: 4.7),
          DoctorModel(name: 'أحمد زيد', specialty: 'أنف وأذن وحنجرة', workingHours: '10:00-17:00', rating: 4.6),
          DoctorModel(name: 'نورا سامي', specialty: 'عظام', workingHours: '9:00-16:00', rating: 4.4),
          DoctorModel(name: 'فاطمة عمر', specialty: 'نسائية وتوليد', workingHours: '8:00-15:00', rating: 4.9),
          DoctorModel(name: 'خالد ياسر', specialty: 'باطنية', workingHours: '10:00-18:00', rating: 4.2),
          DoctorModel(name: 'ريماس علي', specialty: 'أسنان', workingHours: '9:00-17:00', rating: 4.5),
          DoctorModel(name: 'يوسف محمود', specialty: 'جراحة عامة', workingHours: '8:00-16:00', rating: 4.6),
        ]);
      }
    }
  }

  static Box<DoctorModel> get box {
    if (_box == null || !_box!.isOpen) {
      throw Exception('DoctorsBox has not been initialized. Call init() first.');
    }
    return _box!;
  }

  static List<DoctorModel> getDoctors() => box.values.toList();
}