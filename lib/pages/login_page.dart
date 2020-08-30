import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediguideapp/pages/HomePage.dart';
import 'package:mediguideapp/services/auth.dart';
import 'package:mediguideapp/services/database.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

const loginPagetextstyle = TextStyle(
    fontSize: 50.0, fontWeight: FontWeight.bold);

class LoginPage extends StatefulWidget {
  final Function toggle;
  LoginPage(this.toggle);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _auth = FirebaseAuth.instance;
  //bool showSpinner = false;
  //String pw;
  //String email;
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController pwEditingController = new TextEditingController();
  AuthMethods authService = new AuthMethods();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  signIn() async{
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      await authService.signInwithEmailAndPassword(emailEditingController.text, pwEditingController.text).then((result) async {
        if (result !=null){
          QuerySnapshot userInfoSnapshot = await DatabaseMethods().getUser
          Navigator.pushNamed(context, '/main');
        } else {
          isLoading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator())): Container(
        //inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 70.0, 0.0, 0.0),
                      child: Text(
                          '아이케어에',
                          style: loginPagetextstyle),),
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 140.0, 0.0, 0.0),
                      child: Text(
                          '오신 것을',
                          style: loginPagetextstyle),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 210.0, 0.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                              '환영합니다',
                              style: loginPagetextstyle),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '!',
                            style: TextStyle(
                              color: Color(0xFF00cec9),
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        //email = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'ID',
                        labelStyle: TextStyle(
                          color: Color(0xFFdfe6e9),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Color(0xFF00cec9),
                            )
                        ),
                      ),
                      validator: (value){
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)
                            ? null
                            : "맞지않는 이메일 형식";
                      },

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: pwEditingController,
                      onChanged: (value){
                        //pw = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'PW',
                        labelStyle: TextStyle(
                          color: Color(0xFFdfe6e9),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Color(0xFF00cec9),
                            )
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Color(0xFF00cec9),
                            )
                        ),
                      ),
                      validator: (value){
                        return value.length>6
                            ? null
                            : "더 긴 비밀번호를 입력해주세요";
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){
                          //Navigator.pushNamed(context, '/main');
                        },
                        child: Text(
                          'Forgot ID?',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  Material(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: (){},

                    ),
                  )
                ],
              ),
            )*/
            SizedBox(height: 20,),
            Center(
              child: RaisedButton(
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Color(0xffdfe6e9),
                  ),
                ),
                color: Colors.teal,
                focusColor: Color(0xff00b894),
                elevation: 8,
                onPressed: () {
                  signIn();
                  /*try {
                    final user = _auth.createUserWithEmailAndPassword(
                        email: email, password: pw);
                    if (user != null) {
                      Navigator.pushNamed(context, '/chat');
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch(e){
                    print(e);
                  }*/
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
