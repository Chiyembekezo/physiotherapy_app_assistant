
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:physiotherapy_app_assistant/constants.dart';
import 'package:physiotherapy_app_assistant/pages/agora_api/src/pages/homepage.dart';
import 'package:physiotherapy_app_assistant/pages/agora_api/src/pages/index.dart';
import 'package:physiotherapy_app_assistant/pages/chatPages/chat_app_main.dart';
import 'package:physiotherapy_app_assistant/pages/upload.dart';
import 'package:physiotherapy_app_assistant/widgets/bottom_nav_bar.dart';
import 'package:physiotherapy_app_assistant/widgets/search_bar.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              title: "Today",
              svgScr: "assets/icons/calendar.svg", press: (){},
            ),
            BottomNavItem(
              title: "All Exercises",
              svgScr: "assets/icons/gym.svg",
              isActive: true,press: (){},
            ),
            BottomNavItem(
              title: "Settings",
              svgScr: "assets/icons/Settings.svg", press: (){},
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xff2b4570),
            ),
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ChatPageMain())),
                      child:Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: const BoxDecoration(
                            color: Color(0xff3E64A2),
                            shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset("assets/icons/message.svg",),
                        ),
                      ),
                    ),
                    const Text("Welcome Dr.",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600,
                        ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical:  5),
                      child: CupertinoTextField(
                        textInputAction: TextInputAction.done,

                        placeholder: 'Search',
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
                          child: const Icon(CupertinoIcons.search),
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
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            svgScr: "assets/Exercises.svg",
                            title: "Exercises",
                            press: (){},
                          ),
                          CategoryCard(
                              svgScr: "assets/Exercises.svg",
                              title: "Patients",
                              press: (){},
                          ),
                          CategoryCard(
                              svgScr: "assets/Exercises.svg",
                              title: "Upload Exercises",
                              press: () => Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UploadingScreen())),
                          ),
                          CategoryCard(
                              svgScr: "assets/Exercises.svg",
                              title: "Consultation Room",
                              press: () => Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => IndexPage())),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
            )
          ]
        )
      );
    }


  }
class CategoryCard extends StatelessWidget {
  final String svgScr;
  final String title;
  final VoidCallback press;
  const CategoryCard({
    Key? key,
    required this.svgScr,
    required this.title,
    required this.press,
}) :super(key: key);

  @override
  Widget build(BuildContext context){
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset:Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: Color(0xff686868),
              ),
            ],
          ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding:const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  SvgPicture.asset(svgScr),
                  const Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff2b4570),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
        ),
    );
  }
}