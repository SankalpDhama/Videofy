import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:videofy/resources/JitsiMeet.dart';
import 'package:videofy/resources/auth.dart';
import 'package:videofy/utils/colors.dart';
import 'package:videofy/widgets/MeetingOption.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final Auth _auth = Auth();
  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();
  late TextEditingController meetingController;
  late TextEditingController nameController;
  void initState() {
    setState(() {
      meetingController = TextEditingController();
      nameController = TextEditingController(text: _auth.user.displayName);
      super.initState();
    });
  }
  void dispose(){
    super.dispose();
    meetingController.dispose();
    nameController.dispose();
  }
  bool isAudioMuted=true;
  bool isVideoMuted=true;
  joinMeeting() {
    _jitsiMeetMethods.createMeeting( roomName: meetingController.text, isAudio: isAudioMuted, isVideo: isVideoMuted,username: nameController.text);
  }
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
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room Id',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          const SizedBox(),
          InkWell(
            onTap: joinMeeting,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join A Meeting',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(),
          MeetingOption(text: 'Mute Audio', isMute: isAudioMuted, onChange: onAudioMuted),
          MeetingOption(text: 'Turn Of Video', isMute: isVideoMuted, onChange: onVideoMuted)
        ],
      ),
    );
  }
  onVideoMuted(bool val){
    setState(() {
      isVideoMuted=val;
    });
  }
  onAudioMuted(bool val){
    setState(() {
      isAudioMuted=val;
    });
  }
}
