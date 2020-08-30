import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediguideapp/extra_widgets/topics_icon.dart';
import 'package:mediguideapp/extra_widgets/adbox.dart';


class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
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
                '토픽',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Topics_icon(
                  ic: FontAwesomeIcons.userMd,
                  name: '수술상담',
                  onPressed: (){}
                ),
                Topics_icon(
                  ic: FontAwesomeIcons.eye,
                  name: '시력교정',
                  onPressed: (){},
                ),
                Topics_icon(
                  ic: FontAwesomeIcons.fileMedical,
                  name: '안구건강',
                  onPressed: (){},
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Topics_icon(
                  ic: FontAwesomeIcons.hospitalUser,
                  name:'추천안과',
                  onPressed: (){},
                ),
                Topics_icon(
                    ic: FontAwesomeIcons.glasses,
                    name: '안경모여',
                    onPressed: (){}
                ),
                Topics_icon(
                  ic: FontAwesomeIcons.lowVision,
                  name: '렌즈모여',
                  onPressed: (){}
                )
              ],
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
                '수술',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 400,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ContentBox(
                    imgPath: 'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                    text: '안경을 쓰는 것에 비해 미용상의 효과가 좋은 것이 사람들이 콘택트 렌즈를 찾는 원인일 것입니다. 또한 안경이 무거운 데 비해 거의 무게를 느끼지 않고 시야가 넓으며 물체가 휘어 보이는 것이 별로 없습니다. 근시가 아주 심한 분들은 안경을 쓰면 물체가 다소 작아 보이는 데 콘택트 렌즈를 쓰는 사람들은 이 작아 보이는 현상 역시 많이 줄일 수 있습니다. 그러나 단점으로 눈물이 적은 사람은 사용할 수 없다는 것입니다. 콘택트 렌즈는 눈물에 떠 있다고 생각하시면 되는데 렌즈가 뜨는데 필요한 눈물이 적어지게 되면 눈을 깜빡일 때마다 검은동자에 상처를 주게 됩니다.',
                    identity:'연세안과의사',
                    name:'홍길동'
                ),
                ContentBox(
                  imgPath: 'https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                  text: '종류로는 재질에 따라 딱딱한 하드(경성) 콘택트 렌즈와 부드러운 소프트(연성) 콘택트 렌즈로 나눌 수 있습니다. 소프트 콘택트 렌즈에는 매일 착용하는 소프트 콘택트 렌즈와 한 번 착용하면 며칠 동안 계속 사용하는 장기간 착용 렌즈(extended wear lens), 일회용 소프트 콘택트 렌즈, 시력이 없지만 눈이 하얗게 변하여 사회 생활에 불편한 환자들을 위한 미용 홍채 모양 렌즈 등이 있습니다.',
                  identity: '세브란스안과의사',
                  name: '윤동주',
                )
              ],
            ),
          ),
          SizedBox(height: 30,),

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
                '이 안경/렌즈 어때?',
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
                AdBox(
                  Adimg: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                  MyText: '더좋은 선글라스',
                  name: '',
                  intro: '',
                ),
                SizedBox(width: 15,),
                AdBox(
                  Adimg: 'https://images.unsplash.com/photo-1555617117-08d2a80f6aa9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                  MyText: '굿글라스 안경',
                  name: '',
                  intro: '',
                ),
                SizedBox(width: 15,),
                AdBox(
                  Adimg: 'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
                  MyText: '더섹시 안경',
                  name: '',
                  intro: '',
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget ContentBox({String imgPath, String identity, String text, String name}){
  return Padding(
    padding: EdgeInsets.only(left: 30, right: 30),
    child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 20.0),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            border: Border(
                    top: BorderSide(
                        color: Colors.grey,
                        width: .5
                    ),
                    bottom: BorderSide(
                        color: Colors.grey,
                        width: .5
                    ),
                    right: BorderSide(
                        color: Colors.grey,
                        width: .5
                    ),
                    left: BorderSide(
                        color: Colors.grey,
                        width: .5
                    ),
                  ),
            color: Colors.white,
            boxShadow: [BoxShadow(
                offset: Offset(5,5),
                color: Colors.grey,
                      blurRadius: 5
                      )]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: NetworkImage(imgPath),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  padding:EdgeInsets.only(left:10),width: 150,child: Text(name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                              Container(
                                  padding:EdgeInsets.only(left:10),width: 150,child: Text(identity, style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,))
                            ],
                          )
                    ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 200,
                        width: 400,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color(0xffb2bec3)
                              )
                            )
                            ),
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 10
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),



    );

}

/*Widget ContentBox({String imgPath, String identity, String text, String name}){
  return Padding(
    padding: EdgeInsets.only(left: 30, right: 30),
    child: Container(
        child: Stack(
            children: <Widget>[
              Container(height: 400),
              Positioned(
                top: 30,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 20.0),
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Colors.grey,
                            width: .5
                        ),
                        bottom: BorderSide(
                            color: Colors.grey,
                            width: .5
                        ),
                        right: BorderSide(
                            color: Colors.grey,
                            width: .5
                        ),
                        left: BorderSide(
                            color: Colors.grey,
                            width: .5
                        ),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          offset: Offset(5,5),
                          color: Colors.grey,
                          blurRadius: 5
                      )]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: NetworkImage(imgPath),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                  padding:EdgeInsets.only(left:10),width: 150,child: Text(name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                              Container(
                                  padding:EdgeInsets.only(left:10),width: 150,child: Text(identity, style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 200,
                        width: 400,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Color(0xffb2bec3)
                                  )
                              )
                          ),
                          child: Text(
                            text,
                            style: TextStyle(
                                fontSize: 10
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]
        )
    ),
  );

}*/