import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy_app_assistant/firebase_methods/methods.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/demo.dart';
import 'package:physiotherapy_app_assistant/pages/upload.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CupertinoNavigationBar(
          trailing: GestureDetector(
            child: IconButton(
              icon: const Icon(CupertinoIcons.chat_bubble_2_fill),
              color: Colors.white,
              iconSize: 32.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DemoScreen()));
              },
            ),
          ),
          transitionBetweenRoutes: true,
          middle: const Text('Physio App',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Color(0xff3E64A2)),
    );
  }
}
