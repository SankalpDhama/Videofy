import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:videofy/resources/auth.dart';
class JitsiMeetMethods{
    final Auth _auth=Auth();
  void createMeeting(String name,bool isAudio,bool isVideo) async{
    try {
      // Define the meeting options
      var options = JitsiMeetingOptions(
        roomNameOrUrl: name,userDisplayName: _auth.user.displayName,
      userEmail: _auth.user.email,userAvatarUrl: _auth.user.photoURL,isAudioMuted: isAudio,isVideoMuted: isVideo);

      // Join the meeting
      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (error) {
      print("Error joining meeting: $error");
    }
  }
}