import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mediguideapp/pages/HomePage.dart';
import 'package:mediguideapp/pages/hospital_search.dart';
import 'package:mediguideapp/pages/reservation.dart';
import 'package:mediguideapp/services/auth.dart';
import 'package:mediguideapp/services/authenticate.dart';
import 'pages/social.dart';
import 'package:mediguideapp/pages/message_search.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: 홈',
      style: optionStyle,
    ),
    Text(
      'Index 1: 쇼핑',
      style: optionStyle,
    ),
    Text(
      'Index 2: 예약',
      style: optionStyle,
    ),
    Text(
      'Index 3: 소셜',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs = [
    HomePage(),
    HospitalPage(),
    ReservationPage(),
    SocialPage()
  ];
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff636e72)),
          elevation: 10.0,
          backgroundColor: Colors.white70,
          /*leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            onPressed: (){},
          ),*/
          title: Text(
            '메디가이드',
            style: TextStyle(
              color: Color(0xff636e72),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
              ),
              iconSize: 40.0,
              onPressed: (){},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('메디가이드란?'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('내 병원'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('로그아웃'),
                onTap: (){
                  authMethods.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Authenticate()
                  ));

                },
              )
            ],
          ),
        ),
        body: tabs[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.message),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SearchMessage()
            ));
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.white70,
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff636e72),),
            title: Text('홈'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Color(0xff636e72),),
            title: Text('안과'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment,color: Color(0xff636e72),),
            title: Text('예약'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle,color: Color(0xff636e72),),
            title: Text('소셜'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
    ),
      );
  }
}
