import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediguideapp/extra_widgets/adbox.dart';
import 'package:mediguideapp/pages/message_search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFecf0f1),
                      style: BorderStyle.solid,
                      width: 2.5
                    )
                  )
                ),
                child: Text(
                  '요즘 트렌드',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xFFecf0f1),
                            style: BorderStyle.solid,
                            width: 2.5
                        )
                    )
                ),
                child: Text(
                  '메인 게시판',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),

          ],
        ),
      //image carousel
    );
  }
}

// ignore: non_constant_identifier_names
