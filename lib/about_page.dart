import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
              color: AppColors.maroon,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/euc.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          verticalSpacer(16),
          createHeader(
            "Manuel S. Enverga University Foundation – Candelaria, Inc.",
          ),
          verticalSpacer(6),
          const Text(
            "\"For God and Country\"",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: AppColors.maroonLight,
            ),
          ),
          verticalSpacer(4),
          const Text(
            "Empowering Students Through Excellence, Growth, and Innovation",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
          verticalSpacer(16),

          Row(
            children: const [
              Icon(Icons.calendar_today, color: AppColors.gold),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Founded in 1992 — now celebrating its 34th Founding "
                  "Anniversary, themed \"Byting Into the Future.\"",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          verticalSpacer(20),

          createInfoCard(
            icon: Icons.flag,
            title: "University Mission",
            body:
                "The Manuel S. Enverga University Foundation is a private, "
                "non-stock, non-profit, non-sectarian educational "
                "foundation with a three-fold function — instruction, "
                "research, and community service — offering responsive "
                "and alternative programs supportive of national "
                "development goals and standards of global excellence.",
          ),
          createInfoCard(
            icon: Icons.emoji_events_outlined,
            title: "University Goal",
            body:
                "The Manuel S. Enverga University Foundation shall produce "
                "graduates who have research-based knowledge, leadership "
                "and managerial skills, and professionalism.",
          ),

          verticalSpacer(8),
          createHeader("Core Values (MSEUF)"),
          verticalSpacer(4),
          const Text(
            "Five values guide every Envergista's academic and personal "
            "journey:",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
          verticalSpacer(8),
          createInfoCard(
            icon: Icons.self_improvement,
            title: "Mindfulness",
            body:
                "Observing thoughts and feelings without judgment, and "
                "cultivating self-awareness, emotional intelligence, and "
                "compassion.",
          ),
          createInfoCard(
            icon: Icons.volunteer_activism,
            title: "Service",
            body:
                "Engaging in meaningful community service and seeking out "
                "opportunities to make a positive impact in the community.",
          ),
          createInfoCard(
            icon: Icons.star_outline,
            title: "Excellence",
            body:
                "Pursuing the highest standards of academic and personal "
                "achievement through continuous learning and improvement.",
          ),
          createInfoCard(
            icon: Icons.diversity_3,
            title: "Unity",
            body:
                "Creating a diverse and inclusive learning environment "
                "that promotes collaboration, teamwork, and respect for "
                "others.",
          ),
          createInfoCard(
            icon: Icons.shield_outlined,
            title: "Fortitude",
            body:
                "Cultivating mental toughness, perseverance, and "
                "resilience in the face of challenges and setbacks.",
          ),
        ],
      ),
    );
  }
}
