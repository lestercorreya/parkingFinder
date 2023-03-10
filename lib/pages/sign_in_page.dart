import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parking_finder/components/custom_password_field.dart';
import 'package:parking_finder/components/custom_email_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = '';

  void validate() {
    if (_formKey.currentState!.validate()) {
      print("validated");
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFed6436),
        title: const Text(
          'Sign In',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomEmailField(controller: emailController),
                CustomPasswordField(
                    label: 'Password', controller: passwordController),
                const SizedBox(height: 15.0),
                Text(errorMessage,
                    style: const TextStyle(
                        color: Colors.red, fontSize: 12.0, letterSpacing: 0.5)),
                const SizedBox(height: 15.0),
                TextButton(
                    onPressed: validate,
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w700),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFed6436),
                        primary: Colors.white,
                        minimumSize: const Size.fromHeight(60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                const SizedBox(height: 30.0),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            letterSpacing: 1),
                        children: [
                      const TextSpan(text: "Do not have an account yet? "),
                      TextSpan(
                          text: "Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, "/signUpPage");
                            },
                          style: const TextStyle(color: Color(0xFFed6336))),
                    ]))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
