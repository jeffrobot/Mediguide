import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class Topics_icon extends StatelessWidget {
  Topics_icon({@required this.ic, this.name, this.onPressed});

  final IconData ic;
  final String name;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 3,
      onPressed: onPressed,
      child: Column(
        children: <Widget>[
          FaIcon(
            ic,
            size:50,
            color: Color(0xffb2bec3),
          ),
          Text(
              name
          )
        ],
      ),//안경추천 위젯
    );
  }
}
/*FlatButton Topics_icon({IconData ic, String name, Function onPressed}){
  return FlatButton(
    onPressed: onPressed,
    child: Column(
      children: <Widget>[
        FaIcon(
          ic,
          size:50,
          color: Color(0xffb2bec3),
        ),
        Text(
            name
        )
      ],
    ),//안경추천 위젯
  );
}*/