import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parking_finder/components/custom_password_field.dart';
import 'package:parking_finder/components/custom_email_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //firebase auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  String errorMessage = '';

  void validate() async {
    if (_formKey.currentState!.validate()) {
      print("validated");
      if (passwordController.text != confirmPasswordController.text) {
        setState(() {
          errorMessage = "Passwords don't match";
        });
      } else {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
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
          'Sign Up',
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
                CustomPasswordField(
                  label: "Confirm Password",
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 15.0),
                Text(errorMessage,
                    style: const TextStyle(
                        color: Colors.red, fontSize: 12.0, letterSpacing: 0.5)),
                const SizedBox(height: 15.0),
                TextButton(
                    onPressed: validate,
                    child: const Text(
                      "Sign Up",
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
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                          text: "Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, "/signInPage");
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
