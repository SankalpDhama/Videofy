import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:videofy/resources/auth.dart';
import 'package:videofy/resources/firestore.dart';
class JitsiMeetMethods{
    final Auth _auth=Auth();
    final FirebaseMethod _firestore =FirebaseMethod();
  void createMeeting({required String roomName,required bool isAudio,required bool isVideo,String username=''}) async{
    try {
      // Define the meeting options
      String? name;
      if(username.isEmpty){
        name=_auth.user.displayName!;
      }else{
        name=username;
      }
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,userDisplayName: name,
      userEmail: _auth.user.email,userAvatarUrl: _auth.user.photoURL,isAudioMuted: isAudio,isVideoMuted: isVideo);
      // Join the meeting
      _firestore.addMeetingHistory(roomName);
      await JitsiMeetWrapper.joinMeeting(options: options);

    } catch (error) {
      print("Error joining meeting: $error");
    }
  }
}