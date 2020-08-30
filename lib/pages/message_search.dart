import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediguideapp/services/database.dart';

class SearchMessage extends StatefulWidget {
  @override
  _SearchMessageState createState() => _SearchMessageState();
}

class _SearchMessageState extends State<SearchMessage> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchMessageTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapShot;

  initiateSearch(){
    databaseMethods.getUserByUsername(searchMessageTextEditingController.text).then((value){
      setState(() {
        searchSnapShot = value;
      });
    });
  }

  createChatroomAndStartConversation(String username){
    List<String> users = [username, ];
    databaseMethods.createChatRoom();
  }

  Widget searchList(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchSnapShot.documents.length,
      itemBuilder: (context, index){
        return SearchTile(
          userName: searchSnapShot.documents[index].data["name"],
          userEmail: searchSnapShot.documents[index].data["email"],
        );
      }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                //messagesStream();
                //_auth.signOut();
                //authMethods.signOut();
                Navigator.pop(context);
                /*Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => LoginPage()
                ));*/
              }),
        ],
        title: Text('채팅'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "의사/환자 아이디를 쳐주세요.",
                        hintStyle: TextStyle()
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.search
                      ),
                      onPressed: (){
                        initiateSearch();
                      },
                    ),
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                userName,
              ),
              Text(
                userEmail,
              )
            ],
          ),
          Spacer(),
          Container(
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.facebookMessenger
              ),
            ),
          )
        ],
      ),
    );
  }
}

