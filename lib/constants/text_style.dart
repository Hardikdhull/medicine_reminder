import 'package:flutter/material.dart';
import 'color.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.surface,
  );

  // Card Titles (Medicine Name)
  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Card Subtitles (Dose info)
  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // The Orange Time Highlight on the card
  static final TextStyle timeHighlight = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryDark,
  );

  // Placeholder text (Empty list)
  static const TextStyle placeholder = TextStyle(
    fontSize: 18,
    color: AppColors.textSecondary,
  );

  // Button Text
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.surface,
  );

  // Input Field Labels
  static const TextStyle inputLabel = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );
}