import 'package:bautista_finals/landing_page.dart';
import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MSEUFCI Foundation Day",
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite,
        primaryColor: AppColors.maroon,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.maroon,
          primary: AppColors.maroon,
          secondary: AppColors.gold,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.maroon,
          foregroundColor: AppColors.offWhite,
          titleTextStyle: GoogleFonts.poppins(
            color: AppColors.offWhite,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}