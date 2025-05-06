import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:demo2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/presentation/widgets/toast_card.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return DelightToastBar(
          builder: (context) {
            return StyleToastCard(status: false, textTile: 'Đăng nhập thất bại');
          },
          position: DelightSnackbarPosition.top,
          autoDismiss: true,
          snackbarDuration: const Duration(seconds: 1),
        ).show(context);;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> signUp(String username, String password) async {
    String res = 'Có lỗi xảy ra';
    try {
      if (username.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: username,
          password: password,
        );
        await _fireStore.collection('userData').doc(credential.user!.uid).set({
          'userName': username,
          'uid': credential.user!.uid,
          'reminderConfig' : false,
          'score': 0,
          'img' : null,
          'histories' : null,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signIn(String username, String password) async {
    String res = 'Có lỗi xảy ra';
    try {
      if (username.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: username,
          password: password,
        );
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
