// //首页相关接口
// import 'package:codery/data/models/account.dart';
// import 'package:codery/data/models/message.dart';
// import 'package:codery/data/provider/auth_provider.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:provider/provider.dart';

// class UserRespository {
//   //注册
//   static Future<Message> createUser(String userName, String email,
//       String password, BuildContext context) async {
//     // UserCredential userCredential = await FirebaseAuth.instance
//     // .createUserWithEmailAndPassword(email: email, password: password);
//     // User? user = userCredential.user;
//     // if (userCredential.user != null) {
//     //   await user?.updateProfile(
//     //       displayName: userName,
//     //       photoURL: "https://vv.aigeltech.com/static/default.png");
//     //   AuthorityProvider authProvider =
//     //       Provider.of<AuthorityProvider>(context, listen: false);
//     //   authProvider.signIn();
//     //   Account account = Account(
//     //       name: userName,
//     //       email: email,
//     //       password: password,
//     //       fromType: 1,
//     //       photoUrl: user?.photoURL);
//     //   authProvider.setUser(account);
//     // }
//     return Message("0000", "success", "", "");
//   }

//   //普通登录
//   static Future<Message> login(
//       String email, String password, BuildContext context) async {
//     String code = '0000';
//     String message = 'success';
//     // User? user;
//     // await FirebaseAuth.instance
//     //     .signInWithEmailAndPassword(email: email, password: password)
//     //     .then((credential) {
//     //   User? user = credential.user;
//     //   if (user != null) {
//     //     AuthorityProvider authProvider =
//     //         Provider.of<AuthorityProvider>(context, listen: false);
//     //     Account account = Account(
//     //         name: user.displayName!,
//     //         email: user.email!,
//     //         password: password,
//     //         photoUrl: user.photoURL,
//     //         fromType: 1);
//     //     authProvider.signIn();
//     //     authProvider.setUser(account);
//     //   }
//     // }).onError((error, stackTrace) {
//     //   if (error is FirebaseAuthException) {
//     //     FirebaseAuthException e = error;
//     //     if (e.code == 'user-not-found') {
//     //       message = 'No user found for that email.';
//     //     } else if (e.code == 'wrong-password') {
//     //       message = 'Wrong password provided for that user.';
//     //     } else if (e.code == 'invalid-credential') {
//     //       message = 'The supplied auth credential is malformed or has expired.';
//     //     }
//     //   } else {
//     //     message = error.toString();
//     //   }
//     //   code = '0001';
//     // });
//     return Message(code, message, "", "user");
//   }

//   //google登录
//   static Future<Message> loginWithGoogle(BuildContext context) async {
//     String code = '0000';
//     String message = 'success';
//     // User? user;
//     GoogleSignIn googleSignIn = GoogleSignIn(
//       scopes: <String>[
//         'email',
//         'https://www.googleapis.com/auth/contacts.readonly',
//       ],
//     );
//     await googleSignIn.signIn().then((googleSignInAccount) {
//       if (googleSignInAccount != null) {
//         Account? user = Account(
//             name: googleSignInAccount.displayName!,
//             email: googleSignInAccount.email,
//             password: googleSignInAccount.id,
//             fromType: 2,
//             photoUrl: googleSignInAccount.photoUrl);
//         AuthorityProvider authProvider =
//             Provider.of<AuthorityProvider>(context, listen: false);
//         authProvider.setUser(user);
//         authProvider.signIn();
//       } else {
//         code = '0001';
//         message = '登录失败';
//       }
//     }).onError((error, stackTrace) {
//       code = '0001';
//       message = error.toString();
//     });
//     return Message(code, message, "", "");
//   }

//   static Future<Message> loginWithApple(BuildContext context) async {
//     String code = '0000';
//     String message = 'success';
//     Account? user;
//     await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//     ).then((credential) {
//       user = Account(
//           name: credential.givenName ?? "",
//           email: credential.email ?? "",
//           password: credential.userIdentifier ?? "",
//           fromType: 3);
//       AuthorityProvider authProvider =
//           Provider.of<AuthorityProvider>(context, listen: false);
//       authProvider.setUser(user!);
//       authProvider.signIn();
//     }).onError((error, stackTrace) {
//       code = '0001';
//       message = error.toString();
//     });
//     return Message(code, message, "", user);
//   }

// //退出登录
//   static Future<Message> loginOut(BuildContext context) async {
//     AuthorityProvider authorityProvider =
//         Provider.of<AuthorityProvider>(context, listen: false);
//     if (authorityProvider.user != null &&
//         authorityProvider.user!.fromType == 1) {
//       // await FirebaseAuth.instance.signOut();
//     } else if (authorityProvider.user != null &&
//         authorityProvider.user!.fromType == 2) {
//       await GoogleSignIn().signOut();
//     } else if (authorityProvider.user != null &&
//         authorityProvider.user!.fromType == 3) {}
//     authorityProvider.logout();
//     return Message("0000", "success", "", true);
//   }
// }
