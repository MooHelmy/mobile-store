import 'package:flutter/material.dart';

class Custmtextfield extends StatelessWidget {
  const Custmtextfield({
    super.key,
    required this.hinttext,
    this.onSaved,
    this.icon,
  });
  final String hinttext;

  final void Function(String?)? onSaved;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter the filed';
          }
          return null;
        },
        onSaved: onSaved,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          prefixIcon: Icon(icon, color: Colors.pink[900]),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blueAccent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.pinkAccent)),
        ),
      ),
    );
  }
}
