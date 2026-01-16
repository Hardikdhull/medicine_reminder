import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/medicine.dart';
import '../services/notification.dart';

class MedicineProvider extends ChangeNotifier{
  List<Medicine> _medicine = [];
  final Box<Medicine> _box ;
  final Notificatio _notificatio = Notificatio();
  List<Medicine> get medicines => _medicine;
  MedicineProvider(this._box) {
    _loadMedicines();
  }

  void _loadMedicines() {
    _medicine = _box.values.toList();
    _sortMedicines();
    notifyListeners();
  }

  void _sortMedicines() {
    _medicine.sort((a,b){
      final atime = a.scheduledTime.hour*60 + a.scheduledTime.minute;
      final btime = b.scheduledTime.hour*60 +a.scheduledTime.minute;
      return atime.compareTo(btime);
    }
    );
  }
  Future<void> addmedicine(String name, String dose, TimeOfDay time) async {
    final now = DateTime.now();
    var alarmTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    if (alarmTime.isBefore(now)) {
      alarmTime = alarmTime.add(const Duration(days: 1));
    }

    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final newMedicine = Medicine(
      id: id,
      name: name,
      dose: dose,
      scheduledTime: alarmTime,
    );
    await _box.add(newMedicine);
    await _notificatio.schedulenotify(
      newMedicine.key as int,
      'Time for $name',
      'Take $dose of $name',
      alarmTime,
    );
    _loadMedicines();
  }

}
