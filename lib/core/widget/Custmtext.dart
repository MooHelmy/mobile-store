import 'package:flutter/material.dart';

class Cusomtext extends StatelessWidget {
  const Cusomtext(
      {super.key, this.icon, this.onChanged, required this.hinttext});

  @override
  final IconData? icon;
  final String hinttext;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: TextField(
        onChanged: onChanged,
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
