import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField(
      {Key? key, required this.label, required this.controller})
      : super(key: key);

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 12.0, fontFamily: 'Roboto', letterSpacing: 1.5),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (password) {
            if (password == null || password.length < 6) {
              return "Password must be atleast 6 characters long";
            } else {
              return null;
            }
          },
          obscureText: true,
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
