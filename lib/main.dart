import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:videofy/Screen/LoginScreen.dart';
import 'package:videofy/resources/auth.dart';
import 'package:videofy/utils/colors.dart';

import 'Screen/HomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login':(context)=>const LoginScreen(),
        '/home':(context)=>const HomeScreen(),
      },
      home: StreamBuilder(
        stream:Auth().authChanges,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }
            return const LoginScreen();
        },
      )
    );
  }
}
