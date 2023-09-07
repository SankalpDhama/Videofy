import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:videofy/Screen/HistoryMeetingScreen.dart';
import 'package:videofy/Screen/MeetingScreen.dart';
import 'package:videofy/resources/auth.dart';
import 'package:videofy/resources/firestore.dart';
import 'package:videofy/utils/colors.dart';
import 'package:videofy/widgets/CustomButton.dart';
import 'package:videofy/widgets/HomeMeetingButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages=[
    MeetingScreen(),
    HistoryMeetinScreen(),
    CustomButton(text: 'Log Out', onPressed: ()=>Auth().signOut()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('VideoFy'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        unselectedFontSize: 14,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
      body: pages[_page],
    );
  }
}
