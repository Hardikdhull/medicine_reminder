import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/medicine_provider.dart';
import '../constants/color.dart';
import '../constants/text_style.dart';
import '../services/notification.dart';
import 'add_medicine.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Medicines', style: AppTextStyles.heading),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () async {
              await Notificatio().f.show(
                999,
                'Test Notification',
                'If you see this, notifications work!',
                const NotificationDetails(
                  android: AndroidNotificationDetails(
                    'med_channel_v3',
                    'Medicine Reminders',
                    importance: Importance.max,
                    priority: Priority.high,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<MedicineProvider>(
        builder: (context, provider, child) {
          if (provider.medicines.isEmpty) {
            return const Center(
              child: Text(
                'No medicines added yet.\nTap + to add one. By HardikDhull',
                textAlign: TextAlign.center,
                style: AppTextStyles.placeholder,
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.medicines.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              final medicine = provider.medicines[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primaryLight,
                    radius: 24,
                    child: const Icon(Icons.medication,
                        color: AppColors.primary, size: 28),
                  ),
                  title: Text(
                    medicine.name,
                    style: AppTextStyles.cardTitle,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      medicine.dose,
                      style: AppTextStyles.cardSubtitle,
                    ),
                  ),
                  trailing: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DateFormat.jm().format(medicine.scheduledTime),
                      style: AppTextStyles.timeHighlight,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicine()),
          );
        },
        child: const Icon(Icons.add, color: AppColors.surface),
      ),
    );
  }
}