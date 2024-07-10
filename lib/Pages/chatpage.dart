import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversation/service/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class ChatPage extends StatefulWidget {
  String name, profileurl, username;

  ChatPage(
      {required this.name, required this.username, required this.profileurl});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = new TextEditingController();
  String? myName, myProfilePic, myUserName, myEmail, messageId;

  getTheSharedPref() async {
    myName = await SharedPreferenceHelper().getUserDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserPic();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();

    setState(() {

    });
  }

  onTheLoad() async {
    await getTheSharedPref();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    onTheLoad();
  }


  addMessage(bool sendClicked) {
    if (messageController.text != "") {
      String message = messageController.text;
      messageController.text = "";
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('h:mma').format(now);
      Map<String, dynamic>messageInfoMap = {
        "message": message,
        "sendBy": myUserName,
        "ts": formattedDate, //time stamp
        "time": FieldValue.serverTimestamp(),
        "imgUrl": myProfilePic,
      };
      if(messageId == ""){
        messageId = randomAlphaNumeric(10);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xFFc199cd),
                  ),
                  SizedBox(width: 90.0),
                  Text(
                    "Animesh Nilawar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 40.0, bottom: 30.0),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(
                                  left: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2),
                              alignment: Alignment.bottomRight,
                              decoration: BoxDecoration(
                                color: Color(0xfff3f3f3),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              child: Text(
                                "Hello, How are you?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(
                                  right:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width / 2.5),
                              alignment: Alignment.bottomRight,
                              decoration: BoxDecoration(
                                color: Color(0xffd6eefa),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                              ),
                              child: Text(
                                "Hello, How are you... seems nice??",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: messageController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter a message",
                                    hintStyle:
                                    TextStyle(color: Colors.black45)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xFFf3f3f3),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: Icon(Icons.send,
                                    color: Color.fromARGB(255, 122, 117, 117)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
