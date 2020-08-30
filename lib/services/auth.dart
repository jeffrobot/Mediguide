import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../user.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(userId: user.uid) : null;
  }

  Future signInwithEmailAndPassword(String email, String pw) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pw);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future signUpwithEmailandPassword(String email, String pw) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pw);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch (e){
      print(e.toString());
    }
  }
}