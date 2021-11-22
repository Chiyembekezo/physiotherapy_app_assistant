import 'dart:async';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:physiotherapy_app_assistant/pages/agora_api/src/pages/call.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _channelController = TextEditingController();
  bool _validateError = false;

  ClientRole? _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

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
                    'Virtual Concultaion \nRoom',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(30),
                    child: Lottie.asset("assets/doctorapp.json"),
                  ),
                  Container(
                    child: SafeArea(
                      child: Container(
                        width: 270,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CupertinoTextField(
                              controller: _channelController,
                              textInputAction: TextInputAction.next,
                              padding: EdgeInsets.all(16),
                              placeholder: 'Channel Name',
                              placeholderStyle: const TextStyle(
                                color: Color(0xff3E64A2),
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            Column(
                              children: [
                                ListTile(
                                  title:
                                      Text(ClientRole.Broadcaster.toString()),
                                  leading: Radio(
                                    value: ClientRole.Broadcaster,
                                    groupValue: _role,
                                    onChanged: (ClientRole? value) {
                                      setState(() {
                                        _role = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(ClientRole.Audience.toString()),
                                  leading: Radio(
                                    value: ClientRole.Audience,
                                    groupValue: _role,
                                    onChanged: (ClientRole? value) {
                                      setState(() {
                                        _role = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  customButton(size),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: onJoin,
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
                "Join",
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

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
