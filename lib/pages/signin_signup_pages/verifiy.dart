import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:physiotherapy_app_assistant/firebase_methods/methods.dart';
import 'package:physiotherapy_app_assistant/pages/home_page.dart';

class VerificationScreen extends StatefulWidget {
  final User user;
  VerificationScreen({required this.user});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final auth = FirebaseAuth.instance;
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User _currentUser;
  bool isLoading = false;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CupertinoNavigationBar(
          transitionBetweenRoutes: true,
          middle: Text('Physio App',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: Color(0xff3E64A2)),
      backgroundColor: const Color(0xff2b4570),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Verifiy Your Account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 210,
              padding: EdgeInsets.all(10),
              child: Lottie.asset("assets/emailverification.json"),
            ),
            Text(
              'Name: ${_currentUser.displayName}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email: ${_currentUser.email}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),
            _currentUser.emailVerified
                ? Text(
                    'Email verified',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xff1f9e75),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : Text(
                    'Email not verified',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xfff8333d),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

            const SizedBox(height: 20),
            customButton(size),
            const SizedBox(height: 20),
            customBtn(size),
            Container(
                child: isLoading
                    ? Center(
                        child: Container(
                          height: size.height / 20,
                          width: size.height / 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container())

            // Add widgets for verifying email
            // and, signing out the user
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () async {
        await _currentUser.sendEmailVerification();
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size.height / 16,
              width: size.width / 1.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff3E64A2)),
              alignment: Alignment.center,
              child: const Text(
                "Verify email",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customBtn(Size size) {
    return GestureDetector(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: IconButton(
                icon: const Icon(CupertinoIcons.refresh_bold),
                color: Colors.white,
                iconSize: 32.0,
                onPressed: () async {
                  User? user = await FireAuth.refreshUser(_currentUser);
                  if (user != null) {
                    setState(() {
                      _currentUser = user;
                      isLoading = false;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  } else {
                    print("Verification Failed. Click verify");
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
              ),
              height: size.height / 16,
              width: size.width / 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff3E64A2)),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
