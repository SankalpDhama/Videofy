import 'package:flutter/material.dart';
import 'package:videofy/widgets/CustomButton.dart';
import 'package:videofy/resources/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Auth _authMethods=Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoFy'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Join a Meet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(text: 'Login',onPressed: ()async{
            bool res=await _authMethods.signInWithGoogle(context);
            if(res){
              Navigator.pushNamed(context, '/home');
            }
          },),
        ],
      ),
    );
  }
}
