import 'package:flutter/material.dart';

import 'widget/Addmaintenace_body.dart';

class Addmaintanec extends StatelessWidget {
  const Addmaintanec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffDFF2F0),
      body: Maintenace_body(),
    );
  }
}
