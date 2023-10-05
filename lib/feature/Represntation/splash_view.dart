import 'package:elkhwaga_stor/cubit/Serviecs_cubit/serviecs_cubit.dart';
import 'package:elkhwaga_stor/feature/Userhome/Userhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../app_images.dart';
import '../../const/constants.dart';
import '../../core/utils/size_config.dart';

class splash_view extends StatefulWidget {
  const splash_view({super.key});

  @override
  State<splash_view> createState() => _splash_viewState();
}

class _splash_viewState extends State<splash_view>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadeinganimation;
  @override
  void initState() {
    BlocProvider.of<ServiecsCubit>(context).loadProduct();
    viewdelay();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    fadeinganimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: klogocolor,
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize! * 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FadeTransition(
              opacity: fadeinganimation!,
              child: const Text(
                " ELKWAGA ",
                style: TextStyle(
                    fontFamily: 'Pacifico', fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Image.asset(Assets.imagesViewImageMobileStoreLogoDesign232149750711),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FadeTransition(
              opacity: fadeinganimation!,
              child: const Text(
                " STORE ",
                style: TextStyle(
                    fontFamily: 'Pacifico', fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

viewdelay() {
  Future.delayed(const Duration(seconds: 2), () {
    Get.to(() => const Userhome());
  });
}
