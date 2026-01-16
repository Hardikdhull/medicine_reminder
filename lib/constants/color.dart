import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Core Palette
  static const Color primary = Colors.teal;
  static const Color secondary = Colors.orange;

  // Variations for UI depth (Backgrounds, lighter shades)
  static final Color primaryLight = Colors.teal.shade100;
  static final Color secondaryLight = Colors.orange.shade100;
  static final Color secondaryDark = Colors.deepOrange;

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Colors.redAccent;

  // Text Colors
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.grey;
}