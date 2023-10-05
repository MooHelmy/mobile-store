import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Data/models/productsmodel.dart';
import '../../../../../../const/constants.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widget/Custmtextfield.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/custom_image.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../cubit/Serviecs_cubit/serviecs_cubit.dart';
import '../../../../../../generated/l10n.dart';

class Addproduct_body extends StatefulWidget {
  const Addproduct_body({super.key});

  @override
  State<Addproduct_body> createState() => _Addproduct_bodyState();
}

class _Addproduct_bodyState extends State<Addproduct_body> {
  File? image;
  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    String? name, price, description, originalPrice, location, amount;
    GlobalKey<FormState> formstate = GlobalKey();

    return BlocConsumer<ServiecsCubit, ServiecsState>(
      listener: (context, state) {
        if (state is ImageCubitSuccess) {
          location = state.url;
        }
        if (state is Addproudctsucess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(S.of(context).itemadd)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 7),
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Custmtextfield(
                    hinttext: S.of(context).Productname,
                    onSaved: (data) {
                      name = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).Productprice,
                    onSaved: (data) {
                      price = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).Productdescription,
                    onSaved: (data) {
                      description = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).Productoriginalprice,
                    onSaved: (data) {
                      originalPrice = data;
                    },
                  ),
                  Custmtextfield(
                    hinttext: S.of(context).Productamount,
                    onSaved: (data) {
                      amount = data;
                    },
                  ),
                  custom_imagee(
                      image: image,
                      onPressed: () async {
                        var imagep = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        setState(() {
                          imagep == null
                              ? image = null
                              : image = File(imagep.path);
                        });
                        if (image != null) {
                          BlocProvider.of<ServiecsCubit>(context)
                              .uploadImage(image: image!);
                        }
                      },
                      onPresse_gallery: () async {
                        var imagep = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          imagep == null
                              ? image = null
                              : image = File(imagep.path);
                        });
                        if (image != null) {
                          BlocProvider.of<ServiecsCubit>(context)
                              .uploadImage(image: image!);
                        }
                      }),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 3,
                  ),
                  custom_button(
                    isloading: state is Addproudctloading ? true : false,
                    text: S.of(context).add,
                    color: kmainA,
                    onTap: () {
                      if (formstate.currentState!.validate()) {
                        formstate.currentState!.save();

                        productmodel model = productmodel(
                            name: name!,
                            price: price!,
                            description: description!,
                            originalprice: originalPrice!,
                            location: location!,
                            amount: amount!);

                        BlocProvider.of<ServiecsCubit>(context)
                            .Add_product(model: model);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
