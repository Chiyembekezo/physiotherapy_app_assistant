import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy_app_assistant/firebase_methods/methods.dart';
import 'package:physiotherapy_app_assistant/pages/otp_pages/verification_methods.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/signin_docs.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/verifiy.dart';

class SignupDoctorScreen extends StatefulWidget {
  @override
  _SignupDoctorState createState() => _SignupDoctorState();
}

class _SignupDoctorState extends State<SignupDoctorScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _hospital = TextEditingController();

  bool isLoading = false;
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
      body: isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 25),
            Container(
                child: SafeArea(
                  key: formKey,
                  child: Container(
                    width: 340,
                    padding: EdgeInsets.all(14),
                    color: Color(0xffffffff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Create your account',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xff3E64A2),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 25),
                        CupertinoTextField(
                          controller: _name,
                          textInputAction: TextInputAction.next,
                          padding: EdgeInsets.all(16),
                          placeholder: 'Full name (Start with Dr.)',
                          placeholderStyle: const TextStyle(
                            color: Color(0xff3E64A2),
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          prefix: CupertinoButton(
                            onPressed: () {
                              /*Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => LandingPage(),
                            ),
                          );*/
                            },
                            child: Icon(CupertinoIcons.person_solid),
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.lightBackgroundGray,
                            border: Border.all(
                              color: CupertinoColors.lightBackgroundGray,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),

                          ),

                        ),
                        const SizedBox(height: 16),
                        CupertinoTextField(
                          controller: _email,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          padding: EdgeInsets.all(16),
                          placeholder: 'Email',
                          placeholderStyle: TextStyle(
                              color: Color(0xff3E64A2),
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          prefix: CupertinoButton(
                            onPressed: () {
                              /*Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => LandingPage(),
                            ),
                          );*/
                            },
                            child: Icon(CupertinoIcons.mail_solid),
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.lightBackgroundGray,
                            border: Border.all(
                              color: CupertinoColors.lightBackgroundGray,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CupertinoTextField(
                          controller: _password,
                          textInputAction: TextInputAction.next,
                          padding: EdgeInsets.all(16),
                          placeholder: 'Password',
                          obscureText: true,
                          placeholderStyle: TextStyle(
                              color: Color(0xff3E64A2),
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          prefix: CupertinoButton(
                            onPressed: () {
                              /*Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => LandingPage(),
                            ),
                          );*/
                            },
                            child: Icon(CupertinoIcons.lock_fill),
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.lightBackgroundGray,
                            border: Border.all(
                              color: CupertinoColors.lightBackgroundGray,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CupertinoTextField(
                          controller: _hospital,
                          padding: EdgeInsets.all(16),
                          placeholder: 'Hospital under',
                          placeholderStyle: TextStyle(
                              color: Color(0xff3E64A2),
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          prefix: CupertinoButton(
                            onPressed: () {
                              /*Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => LandingPage(),
                            ),
                          );*/
                            },
                            child: Icon(CupertinoIcons.building_2_fill),
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.lightBackgroundGray,
                            border: Border.all(
                              color: CupertinoColors.lightBackgroundGray,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'By creating an account you agree to our Terms of Service and Privacy Policy.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xff3E64A2),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            customButton(size),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SigninDoctorScreen())),
              child: Text(
                "Back to Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_name.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty &&
            _hospital.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          FireAuth.createAccount(
              _name.text, _email.text, _password.text, _hospital.text)
              .then((user) {
            if (user != null) {
              print("Created account successfully");
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (_) => VerificationScreen(user: user)));
            } else {
              print("Failed to Created account");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please Fillout all Fields");
        }
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
                "Sign Up",
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
}
