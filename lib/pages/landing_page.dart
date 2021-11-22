import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/signin_docs.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/singin_patient.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b4570),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'UTH PhysioApp \nAssistant',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 500,
              padding: EdgeInsets.all(70),
              child: Lottie.asset("assets/treadmill.json"),
            ),
            Container(
              child: SafeArea(
                child: Container(
                  width: 390,
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff3E64A2),
                                    minimumSize: const Size(130, 40),
                                  ),
                                  child: Text(
                                    "Patient",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        builder: (context) => SigninPatientScreen(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xffffffff),
                                    minimumSize: const Size(130, 40),
                                  ),
                                  child: Text(
                                    "Doctor",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xff3E64A2)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        builder: (context) => SigninDoctorScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ]))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
