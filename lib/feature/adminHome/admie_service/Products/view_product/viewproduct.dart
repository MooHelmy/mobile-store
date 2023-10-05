import 'package:elkhwaga_stor/Data/models/productsmodel.dart';
import 'package:flutter/material.dart';

import 'widget/viewproduct_body.dart';

class viewproduct extends StatelessWidget {
  const viewproduct({super.key});
  @override
  Widget build(BuildContext context) {
    productmodel model =
        ModalRoute.of(context)!.settings.arguments as productmodel;

    return Scaffold(
      body: viewproduct_body(model: model),
    );
  }
}
