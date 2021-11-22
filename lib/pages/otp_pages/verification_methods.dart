import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:physiotherapy_app_assistant/pages/home_page.dart';
import 'package:physiotherapy_app_assistant/pages/upload.dart';

class VerifyScreen extends StatefulWidget {
  VerifyScreen({Key? key}) : super(key: key);
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _phone = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CupertinoNavigationBar(
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
            const SizedBox(height: 50),
            const Text(
              'Consultation Chat Room',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 200,
              padding: EdgeInsets.all(30),
              child: Lottie.asset("assets/chat.json"),
            ),
            Container(
              child: SafeArea(
                child: Container(
                  width: 350,
                  padding: EdgeInsets.all(15),
                  color: Color(0xffffffff),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'OTP Verification',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xff3E64A2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CupertinoTextField(
                        controller: _phone,
                        padding: EdgeInsets.all(16),
                        keyboardType: TextInputType.phone,
                        placeholder: 'Phone number',
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
                          child: Icon(CupertinoIcons.phone),
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
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            customButton(size),
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UploadingScreen()));
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
                "Upload",
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
