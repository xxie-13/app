import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class CulturalThemePage extends StatelessWidget {
  const CulturalThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                // bytingbanner
                "assets/images/blank.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          verticalSpacer(16),
          createHeader("Byte The Beat: Cultural Competition 2026"),
          verticalSpacer(8),
          const Text(
            "Part of this year's \"Byting Into the Future\" Founding "
            "Anniversary, the Cultural Competition brings together "
            "performers from elementary to college level for a night of "
            "singing and dancing. Each color organization is preparing a "
            "performance inspired by where technology meets humanity — "
            "the results will be revealed live at the EUC Gymnasium.",
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          verticalSpacer(20),

          createHeader("What to Expect from Each Organization"),
          verticalSpacer(8),
          createInfoCard(
            icon: Icons.smart_toy,
            title: "Golden Hills",
            body:
                "An energetic performance exploring how artificial "
                "intelligence influences different generations.",
          ),
          createInfoCard(
            icon: Icons.rocket_launch,
            title: "Blue Ridge",
            body:
                "A strong, focused presentation taking the audience on a "
                "space-themed adventure.",
          ),
          createInfoCard(
            icon: Icons.psychology,
            title: "Bowling Green",
            body:
                "A look at the future Envergista — courage, analytical "
                "thinking, and staying human in a high-tech world.",
          ),
          createInfoCard(
            icon: Icons.bolt,
            title: "Red Fishers",
            body:
                "A dance exploring physical and genetic limits, and the "
                "discipline it takes to push past natural fatigue.",
          ),

          verticalSpacer(16),
          Row(
            children: const [
              Icon(Icons.palette, color: AppColors.maroon),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Stay tuned — standings and awards will be announced "
                  "once the competition concludes.",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}