import 'package:elkhwaga_stor/const/constants.dart';
import 'package:elkhwaga_stor/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'widget/Editmaintenace_Body.dart';

class Editmaintanec extends StatelessWidget {
  const Editmaintanec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.defaultSize! * 5, left: 10, right: 10),
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: kcolorp),
            child: const Editmaintanec_Body()),
      ),
    );
  }
}
