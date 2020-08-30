import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mediguideapp/pages/HomePage.dart';
import 'package:mediguideapp/pages/social.dart';
import 'package:mediguideapp/services/auth.dart';
import 'package:mediguideapp/services/database.dart';
import 'package:mediguideapp/services/helperfunctions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mediguideapp/services/database.dart';

class RegisterPage extends StatefulWidget {
  final Function toggle;
  RegisterPage(this.toggle);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //final _auth = FirebaseAuth.instance; //authenticate users
  //bool showSpinner = false;
  //String email;
  //String pw;
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController pwTextEditingController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  //String status;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  signMeUp() async{
    if (formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });


      await authMethods.signUpwithEmailandPassword(emailTextEditingController.text, pwTextEditingController.text).then((result){
        if(result != null){
          Map<String, String> userDataMap = {
            "userName" : userNameTextEditingController.text,
            "userEmail" : emailTextEditingController.text
          };
          databaseMethods.uploadUserInfo(userDataMap);
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(userNameTextEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);

          Navigator.pushNamed(context, '/main');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator()),):Container(
        //inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60, left:40, right:40),
              height: 150,
              child: TypewriterAnimatedTextKit(
                speed: Duration( seconds: 1),
                onTap: (){},
                text: [
                  "아이케어 회원가입"
                ],
                textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                alignment: AlignmentDirectional.center,
              ),
            ),
            Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
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
                        return value.isEmpty || value.length < 4 ? "제대로된 아이디를 입력해주세요." : null;
                      },
                    ),
                    TextFormField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        //email = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ? null: "이메일 형식에 맞춰주세요.";
                      },
                    ),
                    TextFormField(
                      controller: pwTextEditingController,
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
                        return value.length > 6 ? null : "비밀번호가 약합니다.";
                      },
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: RaisedButton(
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color(0xffdfe6e9),
                  ),
                ),
                color: Colors.teal,
                focusColor: Color(0xff00b894),
                elevation: 8,
                onPressed: () async {
                  signMeUp();
                  /*setState(() { //because flutter is reactive, setstate to change the value of showSpinner
                    //showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        //email: email, password: pw
                      );
                    if (newUser !=null){
                      Navigator.pushNamed(context, '/chat');
                    }
                    setState(() {
                      //showSpinner = false;
                    });
                  }
                  catch (e){
                    print(e);
                  }*/
                },
              ),
            ),
              ],
            ),
      )
    );
  }
}
