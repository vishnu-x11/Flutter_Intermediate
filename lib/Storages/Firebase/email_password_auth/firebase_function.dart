import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FireBaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

//user signUp
  Future<String?> registerUser({required String email, required String pwd}) async {
    try {
      await  auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  //SignIn User
  Future<String?> loginUser(
      {required String email, required String pwd}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pwd);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
      return e.message;
    }
  }

  ///signOut
  Future<void> logout() async{
    await auth.signOut();
  }
}