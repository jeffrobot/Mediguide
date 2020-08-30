import 'package:flutter/material.dart';
import 'package:mediguideapp/pages/login_page.dart';
import 'package:mediguideapp/pages/register_page.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return LoginPage(toggleView);
    } else {
      return RegisterPage(toggleView);
    }
  }
}
