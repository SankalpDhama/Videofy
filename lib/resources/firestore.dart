import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser?.uid)
      .collection('meeting')
      .snapshots();
  void addMeetingHistory(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .collection('meeting')
          .add({'meeting': meetingName, "createdAt": DateTime.now()});
    } catch (e) {
      print(e);
    }
  }
}
