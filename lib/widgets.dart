import 'package:flutter/material.dart';

class AppColors {
  static const Color maroon = Color(0xFF710000);
  static const Color maroonLight = Color(0xFF8F0000);
  static const Color gold = Color(0xFF93B200);
  static const Color offWhite = Color(0xFFEFEFEF);
}

const List<String> colorOrganizations = [
  "Golden Hills",
  "Bowling Green",
  "Red Fishers",
  "Blue Ridge",
];

const int votesPerParticipant = 5;

int convertParticipantsToVotes(int participants) {
  if (participants <= 0) return 0;
  return participants * votesPerParticipant;
}

String? matchOrganization(String input) {
  final String trimmed = input.trim().toLowerCase();
  for (final String org in colorOrganizations) {
    if (org.toLowerCase() == trimmed) return org;
  }
  return null;
}

List<MapEntry<String, int>> rankTeamsByVotes(Map<String, int> participants) {
  final List<MapEntry<String, int>> entries = participants.entries.toList();
  entries.sort((a, b) => b.value.compareTo(a.value));
  return entries;
}

// sizedbox
Widget verticalSpacer(double height) {
  return SizedBox(height: height);
}

// textfield
Widget createTextfield(
  TextEditingController controller,
  String labelText, {
  TextInputType? keyboardType,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType ?? TextInputType.text,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.maroon),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 59, 59, 59), width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.gold, width: 2),
      ),
    ),
  );
}

// header
Widget createHeader(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.maroon,
    ),
  );
}

//infocard
Widget createInfoCard({
  required IconData icon,
  required String title,
  required String body,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.gold, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.maroon),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.maroon,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    ),
  );
}

// drawer & setState()
Widget createDrawer(
  BuildContext context,
  int currentIndex,
  void Function(int) onSelect,
) {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.home, "label": "About the Foundation"},
    {"icon": Icons.event, "label": "Event Info & Pre-registration"},
    {"icon": Icons.emoji_events, "label": "Miss Enverga Pageant"},
    {"icon": Icons.theater_comedy, "label": "Cultural Theme"},
  ];

  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: AppColors.maroon),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/images/logo.png", height: 50, width: 50),
              const SizedBox(height: 8),
              const Text(
                "MSEUFCI Foundation Day",
                style: TextStyle(color: AppColors.offWhite, fontSize: 16),
              ),
            ],
          ),
        ),
        for (int i = 0; i < items.length; i++)
          ListTile(
            leading: Icon(
              items[i]["icon"] as IconData,
              color: currentIndex == i ? AppColors.gold : AppColors.maroon,
            ),
            title: Text(items[i]["label"] as String),
            selected: currentIndex == i,
            onTap: () {
              onSelect(i);
              Navigator.pop(context);
            },
          ),
      ],
    ),
  );
}