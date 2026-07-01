import 'package:bautista_finals/home_page.dart';
import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maroon,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Manuel S. Enverga University Foundation\nCandelaria, Inc.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Foundation Day Anniversary",
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Tap to continue",
                  style: TextStyle(
                    color: AppColors.offWhite.withValues(alpha: 0.8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
