import 'package:flutter/material.dart';
import 'package:parking_finder/pages/auth_page.dart';
import 'package:parking_finder/pages/sign_in_page.dart';
import 'package:parking_finder/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthPage(),
        '/signInPage': (context) => const SignInPage(),
        '/signUpPage': (context) => const SignUpPage()
      },
      title: "Parking Finder",
    );
  }
}
