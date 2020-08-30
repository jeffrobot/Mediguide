import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediguideapp/extra_widgets/adbox.dart';


class HospitalPage extends StatefulWidget {
  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
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
                '안과 검색',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                    color: Color(0xffdfe6e9),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: TextField(
                        onChanged: (value){},//using this line for the input value path setting
                        style: TextStyle(
                          color: Colors.black
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffdfe6e9),
                          icon: FaIcon(Icons.search),
                          hintText: '병원이름을 알려주세요.',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(5)
                        ),
                      ),
                  ),
            ),
          Container(),
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
                '라섹 추천 안과',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),//추천병원 카테고리 1
          SizedBox(height: 15,),
          Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                AdBox(
                  Adimg: 'https://storage.iseverance.com/2013_obj_sev/main/sev15_170209_2.jpg',
                  name: '세브란스안과병원' ,
                  MyText: '',
                  intro: '신촌 최고의 안과병원!!',
                ),
                SizedBox(width: 15,),
                AdBox(
                  Adimg: 'https://www.iloveeye.com/images/common/img_logo_black.png',
                  name: '밝은세상안과의원' ,
                  MyText: '',
                  intro: '강남 최고의 안과병원!!',
                )
              ],
            ),
          ),
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
                '녹내장 추천 안과',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
              height: 400,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                children: <Widget>[
                  AdBox(Adimg:'https://images.unsplash.com/photo-1579684385127-1ef15d508118?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                    MyText: '연세안과',
                    name: '연세안과',
                    intro: '여러분의 소중한 두 눈을 케어해드립니다',
                  ),
                  SizedBox(width: 15,),
                  AdBox(
                    Adimg:'https://images.unsplash.com/photo-1512099053734-e6767b535838?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                    MyText: '안경점 1',
                    name: '고려안과',
                    intro: '여러분의 소중한 두 눈을 망쳐드립니다',
                  ),
                  SizedBox(width: 15,),
                  AdBox(
                    Adimg:'https://images.unsplash.com/photo-1483412468200-72182dbbc544?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80',
                    MyText: '안과 1',
                    name: '가장좋은안과',
                    intro: 'safe, best, clean',
                  ),
                ],
              )// 안과나 안경점 광고를 위한 ListView
          ),
        ],
      ),
    );
  }
}

