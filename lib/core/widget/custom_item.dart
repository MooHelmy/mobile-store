import 'package:elkhwaga_stor/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../Data/models/maintenacemodel.dart';
import '../../Data/models/productsmodel.dart';
import '../../app_images.dart';
import '../utils/size_config.dart';

class custom_item extends StatelessWidget {
  const custom_item({
    super.key,
    this.product,
    this.ontap,
    this.icon,
    this.onpressed,
    this.maintenace,
    this.clientmaintenace = false,
  });
  final productmodel? product;
  final Maintenacemodel? maintenace;
  final void Function()? ontap, onpressed;
  final IconData? icon;
  final bool clientmaintenace;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: ontap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 40,
                        color: Colors.grey,
                        spreadRadius: 0,
                        offset: Offset(1, 1))
                  ]),
              child: Card(
                clipBehavior: Clip.none,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      Text(
                        '${S.of(context).Imagename} :${maintenace == null ? product?.name : maintenace?.clientName}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 60),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.yellowAccent),
                            child: Text(
                              r' $ '
                              '${maintenace == null ? product?.price : maintenace?.price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(onPressed: onpressed, icon: Icon(icon))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            clientmaintenace
                ? Positioned(
                    right: SizeConfig.defaultSize! * 2,
                    top: -SizeConfig.defaultSize! * 5,
                    child: const CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(Assets.imagesMaintenace1)))
                : Positioned(
                    right: SizeConfig.defaultSize! * 2,
                    top: -SizeConfig.defaultSize! * 5,
                    child: CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.blue,
                        backgroundImage: maintenace == null
                            ? NetworkImage(product!.location)
                            : const NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/6009/6009864.png'))),
          ],
        ),
      ),
    );
  }
}
