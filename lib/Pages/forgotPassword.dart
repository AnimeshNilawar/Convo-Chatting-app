import 'package:conversation/Pages/home.dart';
import 'package:conversation/Pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController userMailController = new TextEditingController();

  String email = "";
  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password Reset mail has been send Successfully",
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found With That Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 4.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 105.0)),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Password Recovery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    "Enter your Email",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300),
                  )),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.black38)),
                                child: TextFormField(
                                  controller: userMailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                      color: Color(0xFF7f30fe),
                                    ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 15, 10, 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = userMailController.text;
                                    });
                                    resetPassword();
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    width: 130,
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF7f30fe),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            "Send Email",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => Signup()));
                        },
                        child: Text(
                          " Sign Up Now!",
                          style: TextStyle(
                              color: Color(0xFF7f30fe),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
