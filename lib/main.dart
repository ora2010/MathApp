import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const OlympMatikaApp());
}

class OlympMatikaApp extends StatelessWidget {
  const OlympMatikaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OlympMath',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          elevation: 1,
          centerTitle: false,
          titleTextStyle: AppTextStyles.headingMedium,
        ),
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          headlineSmall: AppTextStyles.headingSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
        ),
        cardTheme: CardThemeData(
          color: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            side: const BorderSide(color: AppColors.border),
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
