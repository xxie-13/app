import 'package:bautista_finals/about_page.dart';
import 'package:bautista_finals/cultural_theme_page.dart';
import 'package:bautista_finals/events_page.dart';
import 'package:bautista_finals/pageant_page.dart';
import 'package:bautista_finals/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final Map<String, int> _teamParticipants = {
    for (final String org in colorOrganizations) org: 0,
  };

  final List<String> _titles = const [
    "About the Foundation",
    "Event Info & Pre-registration",
    "Miss Enverga Pageant",
    "Cultural Theme",
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _registerParticipant(String organization) {
    setState(() {
      _teamParticipants[organization] =
          (_teamParticipants[organization] ?? 0) + 1;
    });
  }

  List<Widget> get _pages => [
        const AboutPage(),
        EventsPage(onParticipantRegistered: _registerParticipant),
        PageantPage(teamParticipants: _teamParticipants),
        const CulturalThemePage(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(      
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

      drawer: createDrawer(context, _selectedIndex, _onItemSelected),

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.maroon,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemSelected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Pageant",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy),
            label: "Theme",
          ),
        ],
      ),
    );
  }
}
