import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdBox extends StatelessWidget {
  AdBox({this.Adimg, this.MyText, this.name, this.intro});

  final String Adimg;
  final String MyText;
  final String name;
  final String intro;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Color(0xff636e72),
              offset: Offset(5,5),
              blurRadius: 7
          )]
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(Adimg),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)
                ),
            ),
            child: Text(
              MyText,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
                Text(
                  intro,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15
                  ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}

/*
Widget AdBox({String Adimg, String MyText}){
  return Container(
    height: 300,
    width: 300,
    padding: EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(Adimg),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white70,
        boxShadow: [BoxShadow(
            color: Color(0xff636e72),
            offset: Offset(5,5),
            blurRadius: 7
        )]

    ),
    child: Text(
      MyText,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,

    ),
  );
}*/