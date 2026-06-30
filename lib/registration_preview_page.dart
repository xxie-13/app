import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class RegistrationPreviewPage extends StatefulWidget {
  final String fullName, studentNumber, course, eventName, organization;
  final void Function(String organization) onParticipantRegistered;

  const RegistrationPreviewPage({
    required this.fullName,
    required this.studentNumber,
    required this.course,
    required this.eventName,
    required this.organization,
    required this.onParticipantRegistered,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPreviewPageState createState() =>
      _RegistrationPreviewPageState();
}

class _RegistrationPreviewPageState extends State<RegistrationPreviewPage> {
  bool _submitted = false;

  void _confirmSubmit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Registration"),
          content: Text(
            "Submit pre-registration for ${widget.fullName} to join "
            "\"${widget.eventName}\" under ${widget.organization}?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                widget.onParticipantRegistered(widget.organization);

                setState(() {
                  _submitted = true;
                });

                final int votesAdded = convertParticipantsToVotes(1);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Pre-registration submitted! +$votesAdded estimated "
                      "votes added to ${widget.organization}'s Miss "
                      "Enverga candidate.",
                    ),
                  ),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Review Your Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createHeader("Preview"),
            verticalSpacer(16),

            Row(
              children: [
                const Icon(Icons.person, color: AppColors.maroon),
                const SizedBox(width: 8),
                Text("Name: ${widget.fullName}"),
              ],
            ),
            verticalSpacer(10),
            Row(
              children: [
                const Icon(Icons.badge, color: AppColors.maroon),
                const SizedBox(width: 8),
                Text("Student No.: ${widget.studentNumber}"),
              ],
            ),
            verticalSpacer(10),
            Row(
              children: [
                const Icon(Icons.school, color: AppColors.maroon),
                const SizedBox(width: 8),
                Text(
                  "Course / Year: "
                  "${widget.course.isEmpty ? "N/A" : widget.course}",
                ),
              ],
            ),
            verticalSpacer(10),
            Row(
              children: [
                const Icon(Icons.event, color: AppColors.maroon),
                const SizedBox(width: 8),
                Text("Event: ${widget.eventName}"),
              ],
            ),
            verticalSpacer(10),
            Row(
              children: [
                const Icon(Icons.groups, color: AppColors.maroon),
                const SizedBox(width: 8),
                Text("Organization: ${widget.organization}"),
              ],
            ),
            verticalSpacer(30),

            if (!_submitted)
              Center(
                child: ElevatedButton(
                  onPressed: _confirmSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.gold,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: const Text("Submit Registration"),
                ),
              )
            else
              Center(
                child: Text(
                  "You're registered! ${widget.organization} Thank you "
                  "for your support.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
