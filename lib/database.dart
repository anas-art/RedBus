import 'package:cloud_firestore/cloud_firestore.dart';

class Databasemethods{
  getUserbyusername(String username)
  async {
    return await Firestore.instance.collection("users")
        .where("name",isEqualTo: username)
        .getDocuments();
  }

  getUserbyEmail(String useremail)
  async {
    return await Firestore.instance.collection("users")
        .where("email",isEqualTo: useremail)
        .getDocuments();      //full data documentss kittum
  }

  ///databasloot upload cheyyunu
  uploaduserinfo(usermap)
  {
    Firestore.instance.collection("users")  ///usersel  create cheydu
        .add(usermap).catchError((e){print(e.toString());});
  }
  createchatroom(String chatroomid,chatroomMap)
  {
    Firestore.instance.collection("chatroom")   ///collection creataaaaaaki
        .document(chatroomid).setData(chatroomMap);
  }
  addconverstataionmessages(String chatroomId,messageMap){
    Firestore.instance.collection("chatroom")
        .document(chatroomId)  //chatroom id edkunnnu
        .collection("chats")  //create chat
        .add(messageMap).catchError((e){print(e.toString());});

  }
  getconverstataionmessages(String chatroomId) async {
    return await Firestore.instance.collection("chatroom")
        .document(chatroomId)  ///rooom idelee documents edthu
        .collection("chats")
        .orderBy("time",descending: false)
        .snapshots();

  }
  getchatrooms(String username) async {
    return await Firestore.instance.collection("chatroom")
        .where("users",arrayContains: username)  ///like equal
        .snapshots();
  }
}