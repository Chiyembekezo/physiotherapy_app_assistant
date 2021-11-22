import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:physiotherapy_app_assistant/pages/signin_signup_pages/signin_docs.dart';

class FireAuth {
  static Future<User?> createAccount(
      String name, String email, String password, String hospital) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        print("Account creation Successful");

        user.updateProfile(displayName: name);

        await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
          "name": name,
          "email": email,
          "hospital": hospital,
          "status": "Unavailible",
        });
        await user.sendEmailVerification();
        return user;
      } else {
        print("Account creation failed");
        return user;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<User?> createPatientAccount(
      String name, String email, String password, String hospital) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        print("Account creation Successful");

        user.updateProfile(displayName: name);

        await _firestore
            .collection('Patients')
            .doc(_auth.currentUser!.uid)
            .set({
          "name": name,
          "email": email,
          "hospital": hospital,
          "health_condition": "",
        });
        await user.sendEmailVerification();
        return user;
      } else {
        print("Account creation failed");
        return user;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future<User?> logout(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.signOut().then((value) {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => SigninDoctorScreen()));
      });
    } catch (e) {
      print("error");
    }
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (user != null) {
      print("Login Successful");
      return user;
    } else {
      print("Login Faild");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logInPatients(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (user != null) {
      print("Login Successful");
      return user;
    } else {
      print("Login Faild");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}


class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  Future _connectToFirebase() async {
    FirebaseFirestore _firestoreChat = FirebaseFirestore.instance;
    FirebaseAuth _authChat = FirebaseAuth.instance;
  }


}
