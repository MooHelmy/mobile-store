import 'package:flutter/material.dart';

import '../../../../../Data/models/maintenacemodel.dart';
import 'widget/viewmaintenace_body.dart';

class maintenace_view extends StatelessWidget {
  const maintenace_view({super.key});
  @override
  Widget build(BuildContext context) {
    Maintenacemodel model =
        ModalRoute.of(context)!.settings.arguments as Maintenacemodel;
    return Scaffold(
      body: maintenace_body(model: model),
    );
  }
}
