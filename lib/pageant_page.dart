import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class PageantPage extends StatefulWidget {
  final Map<String, int> teamParticipants;
  const PageantPage({required this.teamParticipants, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PageantPageState createState() => _PageantPageState();
}

class _PageantPageState extends State<PageantPage> {
  final TextEditingController _estimateOrgController = TextEditingController();
  final TextEditingController _estimateParticipantsController =
      TextEditingController();

  String? _estimateOrg;
  int _estimateExtraVotes = 0;
  int _estimateNewTotal = 0;

  final Map<String, String> _candidates = const {
    "Golden Hills": "Rica Mell Meraña",
    "Blue Ridge": "Dian Antonia Alivia",
    "Red Fishers": "Kyla Mendoza",
    "Bowling Green": "Trixie Larize Macalintal",
  };

  void _calculateEstimate() {
    final String? org = matchOrganization(_estimateOrgController.text);
    final int extraParticipants =
        int.tryParse(_estimateParticipantsController.text) ?? 0;

    if (org == null || extraParticipants <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter a valid organization (${colorOrganizations.join(", ")}) "
            "and a participant count.",
          ),
        ),
      );
      return;
    }

    final int currentParticipants = widget.teamParticipants[org] ?? 0;
    final int extraVotes = convertParticipantsToVotes(extraParticipants);
    final int newTotal =
        convertParticipantsToVotes(currentParticipants + extraParticipants);

    bool wouldTakeLead = true;
    widget.teamParticipants.forEach((otherOrg, otherParticipants) {
      if (otherOrg != org) {
        final int otherVotes = convertParticipantsToVotes(otherParticipants);
        if (otherVotes >= newTotal) wouldTakeLead = false;
      }
    });

    setState(() {
      _estimateOrg = org;
      _estimateExtraVotes = extraVotes;
      _estimateNewTotal = newTotal;
    });

    if (wouldTakeLead) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New Estimated Leader!"),
            content: Text(
              "If $extraParticipants more active participants join "
              "$org, their Miss Enverga candidate (${_candidates[org]}) "
              "would rise to an estimated $newTotal votes — enough to "
              "take the lead!",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "+$extraVotes estimated votes for $org "
            "(projected total: $newTotal votes).",
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _estimateOrgController.dispose();
    _estimateParticipantsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<String, int>> standings =
        rankTeamsByVotes(widget.teamParticipants);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createHeader("Miss Enverga 2026 Candidates"),
          verticalSpacer(4),
          const Text(
            "The pageant is still ongoing — register for an event to add "
            "votes for your organization's candidate.",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
          verticalSpacer(8),

          for (final org in colorOrganizations)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gold),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/pageant_poster.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _candidates[org]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          org,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${convertParticipantsToVotes(widget.teamParticipants[org] ?? 0)} votes",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.maroon,
                    ),
                  ),
                ],
              ),
            ),

          verticalSpacer(20),
          createHeader("Live Standings"),
          verticalSpacer(8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.maroonLight),
            ),
            child: Column(
              children: [
                for (int i = 0; i < standings.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          i == 0 ? Icons.emoji_events : Icons.circle,
                          size: i == 0 ? 20 : 8,
                          color: i == 0 ? AppColors.gold : AppColors.maroon,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "${i + 1}. ${standings[i].key} "
                            "(${_candidates[standings[i].key]})",
                          ),
                        ),
                        Text(
                          "${convertParticipantsToVotes(standings[i].value)} votes",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          verticalSpacer(20),
          createHeader("Vote Conversion Estimator"),
          verticalSpacer(8),
          const Text(
            "Curious how much your group could contribute? Estimate how "
            "many votes a number of active participants would add to "
            "your organization's Miss Enverga candidate.",
            style: TextStyle(fontSize: 13, color: Colors.black87),
          ),
          verticalSpacer(12),
          createTextfield(
            _estimateOrgController,
            "Color Organization (e.g. Red Fishers)",
          ),
          verticalSpacer(12),
          createTextfield(
            _estimateParticipantsController,
            "Active Participants (Preview Only)",
            keyboardType: TextInputType.number,
          ),
          verticalSpacer(16),
          Center(
            child: ElevatedButton.icon(
              onPressed: _calculateEstimate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.maroon,
                foregroundColor: AppColors.offWhite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              icon: const Icon(Icons.calculate),
              label: const Text("Calculate Estimate"),
            ),
          ),
          verticalSpacer(16),
          if (_estimateOrg != null)
            Center(
              child: Text(
                "+$_estimateExtraVotes estimated votes for $_estimateOrg "
                "(projected total: $_estimateNewTotal votes).",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.maroon,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
