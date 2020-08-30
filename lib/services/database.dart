import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username) async{
    return await Firestore.instance.collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
  }
  uploadUserInfo(userMap) async{
    await Firestore.instance.collection("users").add(userMap).catchError((e){
      print(e.toString());
    });
  }

  createChatRoom(chatmap) async{
    await Firestore.instance.collection("chatroom").add(chatmap).catchError((e){
      print(e.toString());
    });
  }
}