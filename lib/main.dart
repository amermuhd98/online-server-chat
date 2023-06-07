import 'package:aplication/screens/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/1page_Screen.dart';
import 'screens/login.dart';
import 'screens/register.dart';

// void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'دردشة جماعية',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //
        initialRoute: _auth.currentUser != null
            ? ChatScreen.screenRoute
            : HelloScreen.screenRoute,
        routes: {
          HelloScreen.screenRoute: (context) => HelloScreen(),
          SignInScreen.screenRoute: (context) => SignInScreen(),
          register.screenRoute: (context) => register(),
          ChatScreen.screenRoute: (context) => ChatScreen(),
        });
  }
}
