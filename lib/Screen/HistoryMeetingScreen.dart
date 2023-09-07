import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:videofy/resources/firestore.dart';

class HistoryMeetinScreen extends StatelessWidget {
  const HistoryMeetinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseMethod().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'RoomName : ${(snapshot.data! as dynamic).docs[index]['meeting']}',
            ),
            subtitle: Text(
                'Joined On : ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
          ),
        );
      },
    );
  }
}
