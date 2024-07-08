//首页相关接口
import 'package:codery/data/models/message.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRespository {
  //注册登录
  static Future<Message> createUser(String userName, String email,
      String password, BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    if (userCredential.user != null) {
      await user?.updateProfile(
          displayName: userName,
          photoURL: "https://vv.aigeltech.com/static/default.png");
      AuthorityProvider authProvider =
          Provider.of<AuthorityProvider>(context, listen: false);
      authProvider.signIn();
      authProvider.setUser(user!);
    }
    return Message("0000", "success", "", user);
  }

  static Future<Message> login(
      String email, String password, BuildContext context) async {
    String code = '0000';
    String message = 'success';
    User? user;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((credential) {
      User? user = credential.user;
      if (user != null) {
        AuthorityProvider authProvider =
            Provider.of<AuthorityProvider>(context, listen: false);
        authProvider.signIn();
        authProvider.setUser(user);
      }
    }).onError((error, stackTrace) {
      if (error is FirebaseAuthException) {
        FirebaseAuthException e = error;
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
        } else if (e.code == 'invalid-credential') {
          message = 'The supplied auth credential is malformed or has expired.';
        }
      } else {
        message = '未知错误';
      }
      code = '0001';
    });
    return Message(code, message, "", user);
  }

//退出登录
  static Future<Message> loginOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Provider.of<AuthorityProvider>(context, listen: false).logout();
    return Message("0000", "success", "", true);
  }
}
