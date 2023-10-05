import 'package:flutter/material.dart';

import '../../../../../Data/models/maintenacemodel.dart';
import 'widget/updatemaintenace_body.dart';

class updatemaintenace extends StatelessWidget {
  const updatemaintenace({super.key});

  @override
  Widget build(BuildContext context) {
    Maintenacemodel model =
        ModalRoute.of(context)!.settings.arguments as Maintenacemodel;
    return Scaffold(
      backgroundColor: const Color(0xffDFF2F0),
      body: updatemaintenace_body(model: model),
    );
  }
}
