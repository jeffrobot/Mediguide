import 'package:flutter/material.dart';
import 'package:mediguideapp/pages/chat_page.dart';
import 'package:mediguideapp/pages/welcome_page.dart';
import 'package:mediguideapp/services/authenticate.dart';
import 'pages/HomePage.dart';
import 'pages/logo_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/hospital_search.dart';
import 'pages/reservation.dart';
import 'pages/social.dart';
import 'main_navigation.dart';
import 'pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      //home: HomePage(),
      //routing
      initialRoute:'/welcome',
      routes: {
        '/': (context) =>LogoPage(),
        '/welcome': (context) =>WelcomePage(),
        //'/login': (context) =>LoginPage(),
        //'/register': (context) =>RegisterPage(),
        '/chat': (context) => ChatScreen(),
        '/homepage': (context) =>HomePage(),
        '/hospital': (context) => HospitalPage(),
        '/reserve': (context) => ReservationPage(),
        '/social': (context) => SocialPage(),
        '/main':(context) => BottomBar(),
        '/authenticate': (context)=>Authenticate()
      },
    );
  }
}

