import 'package:bautista_finals/registration_preview_page.dart';
import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class PreregistrationPage extends StatefulWidget {
  final void Function(String organization) onParticipantRegistered;

  const PreregistrationPage({
    required this.onParticipantRegistered,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PreregistrationPageState createState() => _PreregistrationPageState();
}

class _PreregistrationPageState extends State<PreregistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studNoController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _organizationController =
      TextEditingController();

  void _goToPreview() {
    if (_nameController.text.isEmpty ||
        _studNoController.text.isEmpty ||
        _eventController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all required fields."),
        ),
      );
      return;
    }

    final String? matchedOrg = matchOrganization(_organizationController.text);
    if (matchedOrg == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter a valid color organization: ${colorOrganizations.join(", ")}.",
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {

        return RegistrationPreviewPage(
          fullName: _nameController.text,
          studentNumber: _studNoController.text,
          course: _courseController.text,
          eventName: _eventController.text,
          organization: matchedOrg,
          onParticipantRegistered: widget.onParticipantRegistered,
        );
      }),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _studNoController.dispose();
    _courseController.dispose();
    _eventController.dispose();
    _organizationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event Pre-registration")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createHeader("Register Your Slot"),
            verticalSpacer(16),
            createTextfield(_nameController, "Full Name"),
            verticalSpacer(12),
            createTextfield(
              _studNoController,
              "Student Number",
              keyboardType: TextInputType.number,
            ),
            verticalSpacer(12),
            createTextfield(_courseController, "Course / Year Level"),
            verticalSpacer(12),
            createTextfield(_eventController, "Event you want to join"),
            verticalSpacer(12),
            createTextfield(
              _organizationController,
              "Color Organization (e.g. Blue Ridge)",
            ),
            verticalSpacer(4),
            Text(
              "Choose one: ${colorOrganizations.join(", ")}",
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            verticalSpacer(24),
            Center(
              child: ElevatedButton(
                onPressed: _goToPreview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.maroon,
                  foregroundColor: AppColors.offWhite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text("Preview Registration"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}