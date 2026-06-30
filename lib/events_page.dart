import 'package:bautista_finals/preregistration_page.dart';
import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final void Function(String organization) onParticipantRegistered;
  const EventsPage({required this.onParticipantRegistered, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createHeader("This Year's Event"),
          verticalSpacer(8),
          createInfoCard(
            icon: Icons.bolt,
            title: "EUC34 | Byting Into the Future",
            body:
                "The 34th Founding Anniversary of MSEUF-CI is underway! "
                "Founding Week brings the Color Fun Run & Foam Party, "
                "Intercolor Quiz Shows, Literary and Cultural Competitions, "
                "and the search for this year's Little Miss, Miss Young, "
                "Miss Teen, and Miss Enverga — all leading up to the "
                "Pageant and Coronation Night at the EUC Gymnasium. "
                "Pre-register below to join in and help your color "
                "organization earn votes for its Miss Enverga candidate.",
          ),
          verticalSpacer(16),

          createHeader("Last Year's Event"),
          verticalSpacer(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  // looking back moving f image
                  "assets/images/blank.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: createInfoCard(
                  icon: Icons.history,
                  title: "EUC33 | Looking Back, Moving Forward",
                  body:
                      "Last year's 33rd Founding Anniversary brought the "
                      "community together for an opening parade, color fun "
                      "run, and foam party, followed by a week of academic "
                      "quiz bees, literary and cultural competitions, and "
                      "the search for new Enverga royalty. Blue Ridge's "
                      "Louisse Danielle Segarra was crowned Miss Enverga "
                      "2025, alongside Kaye Ashley Leron (Miss Teen), Irah "
                      "Mae Repaja (Miss Young), and Julianna Trixie "
                      "Labingdalawa (Little Miss).",
                ),
              ),
            ],
          ),
          verticalSpacer(24),

          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PreregistrationPage(
                      onParticipantRegistered: onParticipantRegistered,
                    );
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.maroon,
                foregroundColor: AppColors.offWhite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              icon: const Icon(Icons.how_to_reg),
              label: const Text("Pre-register for an Event"),
            ),
          ),
        ],
      ),
    );
  }
}