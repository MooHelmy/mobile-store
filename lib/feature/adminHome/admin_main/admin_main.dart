import 'package:elkhwaga_stor/feature/adminHome/admin_main/widget/admin_main_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../cubit/Maintenace/maintanece_cubit.dart';
import '../../../generated/l10n.dart';
import '../../Userhome/Userhome.dart';
import '../admie_service/Client/widget/Editmaintenace/Clients.dart';
import '../admie_service/Products/Products.dart';
import '../admie_service/maintenace/maintenace.dart';

class admin_main extends StatefulWidget {
  const admin_main({super.key});

  @override
  State<admin_main> createState() => _admin_mainState();
}

class _admin_mainState extends State<admin_main> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
          if (value == 0) {
            Get.to(
              const admin_main(),
            );
          } else if (value == 1) {
            Get.to(
              const Poducts(),
            );
          } else if (value == 2) {
            BlocProvider.of<MaintenaceCubit>(context).loadMaintenace();
            Get.to(
              const Clients(),
            );
          } else if (value == 3) {
            Get.to(
              const maintenace(),
            );
          } else {
            Get.to(
              const Userhome(),
            );
          }
        },
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: S.of(context).Home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: S.of(context).Products),
          BottomNavigationBarItem(
              icon: const Icon(Icons.group), label: S.of(context).Clients),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: S.of(context).Maintenace),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.group,
              ),
              label: S.of(context).Userpage)
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.green[100],
      body: const admin_main_body(),
    );
  }
}
