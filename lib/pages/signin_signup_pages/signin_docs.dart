import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy_app_assistant/firebase_methods/methods.dart';
import 'package:physiotherapy_app_assistant/pages/home_page.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/signup_docs.dart';

class SigninDoctorScreen extends StatefulWidget {
  @override
  _SigninDoctorScreenState createState() => _SigninDoctorScreenState();
}

class _SigninDoctorScreenState extends State<SigninDoctorScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
            SizedBox(
              height: size.height / 10,
            ),
            const Text(
              'Sign In',
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
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.all(14),
                    color: Color(0xffffffff),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Log into your account',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Color(0xff3E64A2),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 50),
                        CupertinoTextField(
                          controller: _email,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          padding: EdgeInsets.all(16),
                          placeholder: 'Email',
                          placeholderStyle: const TextStyle(
                              color: Color(0xff3E64A2),
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
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
                            child: Icon(CupertinoIcons.mail),
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
                        CupertinoTextField(
                          controller: _password,
                          padding: EdgeInsets.all(16),
                          placeholder: 'Password',
                          obscureText: true,
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
                            child: Icon(CupertinoIcons.lock),
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
                        const SizedBox(height: 25),
                        const Text(
                          'Forgot password?',
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
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SignupDoctorScreen())),
              child: const Text(
                "Got to Sign Up",
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
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              print("Login Successfully");
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else {
              print("Login Not Successful!");
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
                "Sign In",
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
