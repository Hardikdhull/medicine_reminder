import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

// Imports
import 'constants/color.dart';
import 'models/medicine.dart';
import 'providers/medicine_provider.dart';
import 'services/notification.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MedicineAdapter());

  // 2. Open the Box and store it in a variable called 'box'
  final Box<Medicine> box = await Hive.openBox<Medicine>('medicine');

  // 3. Init Notifications
  try {
    await Notificatio().init();
  } catch (e) {
    print("Notification Init Failed: $e");
  }

  // 4. Pass the variable 'box' to MyApp
  runApp(MyApp(databaseBox: box));
}

class MyApp extends StatelessWidget {
  // 5. Declare the variable here so MyApp can accept it
  final Box<Medicine> databaseBox;

  // 6. Require it in the constructor
  const MyApp({super.key, required this.databaseBox});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // 7. Pass 'databaseBox' to the Provider
      create: (_) => MedicineProvider(databaseBox),
      child: MaterialApp(
        title: 'Medicine Reminder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,

          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
            accentColor: AppColors.secondary,
            backgroundColor: AppColors.background,
          ).copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            surface: AppColors.surface,
          ),

          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.surface,
            elevation: 0,
            centerTitle: true,
          ),

          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.surface,
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.surface,
            ),
          ),
        ),
        home: const Home(),
      ),
    );
  }
}