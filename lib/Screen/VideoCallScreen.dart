import 'package:flutter/material.dart';
import 'package:videofy/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join A Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
    );
  }
}
