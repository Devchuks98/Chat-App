import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/auth/login_page.dart';
import 'package:chat_app/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    //run the initialization for web
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: Constants.apiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ));
  } else {
    //run the initialization for android & ios
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  final String title = "Chat-App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: title,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
