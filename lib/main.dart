import 'package:conversation/Pages/chatpage.dart';
import 'package:conversation/Pages/home.dart';
import 'package:conversation/Pages/signin.dart';
import 'package:conversation/Pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDE6FNWfwzL3z-dojPW01C8y58cgDVGu4o",
        appId: "1:636319599504:android:1c0de888e5d34d703b0115",
        messagingSenderId: " ",
        projectId: "chatapp-d04d6"
    ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: SignIn(),
    );
  }
}
