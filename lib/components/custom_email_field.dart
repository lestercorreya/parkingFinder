import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Email Address",
            style: TextStyle(
                fontSize: 12.0, fontFamily: 'Roboto', letterSpacing: 1.5),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (email) {
            if (email == null ||
                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email)) {
              return "Please enter a valid email address";
            } else {
              return null;
            }
          },
          cursorColor: const Color(0xFFed6436),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Color(0xFFED6436))),
          ),
        ),
      ],
    );
  }
}
