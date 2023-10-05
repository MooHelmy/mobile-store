import 'package:flutter/material.dart';

import 'widget/Addproduct_body.dart';

class Addproduct extends StatelessWidget {
  const Addproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffDFF2F0),
      body: Addproduct_body(),
    );
  }
}
