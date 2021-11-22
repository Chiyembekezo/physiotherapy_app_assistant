import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy_app_assistant/pages/chatPages/calls_page.dart';
import 'package:physiotherapy_app_assistant/pages/chatPages/chats_page.dart';
import 'package:physiotherapy_app_assistant/pages/chatPages/contacts_page.dart';
import 'package:physiotherapy_app_assistant/pages/chatPages/settings_pages.dart';

Future _connectToFireBase() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
}

class ChatPageMain extends StatelessWidget {
  ChatPageMain({Key? key}) : super(key: key);
  var pages = [
    const Chats(),
    const Calls(),
    const Contacts(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              label: "Contacts",
              icon: Icon(CupertinoIcons.person_alt_circle),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(CupertinoIcons.settings_solid),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return pages[index];
        },
      ),
    );
  }
}
