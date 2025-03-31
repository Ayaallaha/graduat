// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentModelAdapter extends TypeAdapter<AppointmentModel> {
  @override
  final int typeId = 2;

  @override
  AppointmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentModel(
      doctorName: fields[0] as String,
      specialty: fields[1] as String,
      time: fields[2] as String,
      date: fields[3] as String,
      patientName: fields[4] as String,
      phone: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.doctorName)
      ..writeByte(1)
      ..write(obj.specialty)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.patientName)
      ..writeByte(5)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
