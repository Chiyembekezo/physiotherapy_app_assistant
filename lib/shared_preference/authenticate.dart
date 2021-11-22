import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:physiotherapy_app_assistant/pages/home_page.dart';
import 'package:physiotherapy_app_assistant/pages/landing_page.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_auth.currentUser != null) {
      return HomeScreen();
    } else {
      return LandingPage();
    }
  }
}
