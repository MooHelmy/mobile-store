import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

import '../../../../app_images.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widget/CustomList_main.dart';
import '../../../../core/widget/Custom_appBar.dart';

import '../../../../cubit/Maintenace/maintanece_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../Userhome/Userhome.dart';

import '../../admie_service/Client/widget/Editmaintenace/Clients.dart';
import '../../admie_service/Products/Products.dart';
import '../../admie_service/maintenace/maintenace.dart';

class admin_main_body extends StatelessWidget {
  const admin_main_body({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      S.of(context).Products,
      S.of(context).Clients,
      S.of(context).Maintenace,
      S.of(context).Userpage
    ];
    List<String> icons = [
      Assets.imagesMainiconsPhone6192523,
      Assets.imagesMainiconsClient6009978,
      Assets.imagesMainiconsMechanic10617042,
      Assets.imagesMainiconsClient6009978
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 16),
      child: Column(
        children: [
          custom_appBar(text: S.of(context).Department),
          Expanded(
              child: GridView.builder(
            itemCount: names.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return customlist_main(
                name: names[index],
                assetName: icons[index],
                onTap: () {
                  if (index == 0) {
                    Get.to(const Poducts());
                  } else if (index == 1) {
                    BlocProvider.of<MaintenaceCubit>(context).loadMaintenace();
                    Get.to(const Clients());
                  } else if (index == 2) {
                    Get.to(const maintenace());
                  } else if (index == 3) {
                    Get.to(() => const Userhome());
                  }
                },
              );
            },
          )),
          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.defaultSize! * 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: CarouselSlider(
                  items: [
                    Image.asset(Assets.imagesMaintenace2),
                    Image.asset(Assets.imagesProudcts1),
                    Image.asset(Assets.imagesViewImage2),
                  ],
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      autoPlay: true)),
            ),
          )
        ],
      ),
    );
  }
}
