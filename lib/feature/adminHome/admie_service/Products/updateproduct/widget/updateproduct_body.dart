import 'dart:io';
import 'package:elkhwaga_stor/Data/models/productsmodel.dart';
import 'package:elkhwaga_stor/const/constants.dart';
import 'package:elkhwaga_stor/cubit/Serviecs_cubit/serviecs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widget/Custmtext.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/custom_image.dart';
import '../../../../../../generated/l10n.dart';
import '../../EditProduct/EditProduct.dart';

class updateproduct_body extends StatefulWidget {
  const updateproduct_body({
    super.key,
  });

  @override
  State<updateproduct_body> createState() => _updateproduct_bodyState();
}

class _updateproduct_bodyState extends State<updateproduct_body> {
  @override
  @override
  Widget build(BuildContext context) {
    productmodel model = BlocProvider.of<ServiecsCubit>(context).modelproduct!;

    String? name, price, description, originalprice, location, amount;

    File? image;
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 20),
      child: BlocConsumer<ServiecsCubit, ServiecsState>(
        listener: (context, state) {
          if (state is ImageCubitSuccess) {
            location = state.url;
          }
          if (state is Updatesuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).itemupdate)));
            Get.to(() => const EditProduct());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Cusomtext(
                  hinttext: S.of(context).Productname,
                  onChanged: (data) {
                    name = data;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).Productprice,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).Productdescription,
                  onChanged: (data) {
                    description = data;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).Productoriginalprice,
                  onChanged: (data) {
                    originalprice = data;
                  },
                ),
                Cusomtext(
                  hinttext: S.of(context).Productamount,
                  onChanged: (data) {
                    amount = data;
                  },
                ),
                custom_imagee(
                    image: image,
                    onPressed: () async {
                      var imagep = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        imagep == null
                            ? image = null
                            : image = File(imagep.path);
                      });
                    },
                    onPresse_gallery: () async {
                      var imagep = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        imagep == null
                            ? image = null
                            : image = File(imagep.path);
                      });
                    }),
                SizedBox(
                  height: SizeConfig.defaultSize! * 3,
                ),
                custom_button(
                  text: S.of(context).update,
                  color: kmainA,
                  onTap: () {
                    model.DocId;
                    if (image != null) {
                      BlocProvider.of<ServiecsCubit>(context)
                          .uploadImage(image: image!);
                    }
                    productmodel pmodel = productmodel(
                        name: name == null ? model.name : name!,
                        price: price == null ? model.price : price!,
                        description: description == null
                            ? model.description
                            : description!,
                        originalprice: originalprice == null
                            ? model.originalprice
                            : originalprice!,
                        location: location == null ? model.location : location!,
                        amount: amount == null ? model.amount : amount!);
                    BlocProvider.of<ServiecsCubit>(context)
                        .updateProduct(model: pmodel, id: model.DocId);
                    BlocProvider.of<ServiecsCubit>(context).loadProduct();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
