import 'dart:math';

import 'package:flutter/material.dart';
import 'package:videofy/resources/JitsiMeet.dart';

import '../widgets/HomeMeetingButton.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();

  createNewMeeting() async{
    var random=Random();
    String name=(random.nextInt(100000000)+1000000).toString();
    _jitsiMeetMethods.createMeeting(name, true, true);
  }
  joinNewMeeting(BuildContext context) async{
    Navigator.pushNamed(context, '/videocall');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              icon: Icons.videocam,
              onPressed: createNewMeeting,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              icon: Icons.add_box_rounded,
              onPressed: ()=>joinNewMeeting(context),
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              icon: Icons.calendar_today,
              onPressed: () {},
              text: 'Schedule Meet',
            ),
            HomeMeetingButton(
              icon: Icons.arrow_upward,
              onPressed: () {},
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create Or Join Meeting',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
