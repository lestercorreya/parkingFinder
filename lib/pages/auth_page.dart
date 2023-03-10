import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Flexible(
              flex: 2,
              child: Image(
                  image: AssetImage(
                "assets/images/login-hero-image.png",
              )),
            ),
            Flexible(
                flex: 1,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signInPage");
                      },
                      child: const Text("Sign In",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFed6436),
                          primary: Colors.white,
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signUpPage");
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFf2f2f2),
                          primary: const Color(0xFFed6436),
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                ])),
          ],
        ),
      )),
    );
    ;
  }
}
