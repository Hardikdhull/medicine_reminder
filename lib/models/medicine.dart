import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Medicine extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String dose;
  @HiveField(3)
  final DateTime scheduledTime;
  Medicine({
    required this.id,
    required this.name,
    required this.dose,
    required this.scheduledTime,
  });
}
class MedicineAdapter extends TypeAdapter<Medicine> {
  @override
  final int typeId = 0;
  @override
  Medicine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medicine(
      id: fields[0] as String,
      name: fields[1] as String,
      dose: fields[2] as String,
      scheduledTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Medicine obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dose)
      ..writeByte(3)
      ..write(obj.scheduledTime);
  }
}