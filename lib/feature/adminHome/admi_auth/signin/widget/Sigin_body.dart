import 'package:elkhwaga_stor/cubit/auth/auth_cubit/authcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../app_images.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/Custmtextfield.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../admin_main/admin_main.dart';
import '../../login/loginPage.dart';

class Sigin_body extends StatefulWidget {
  const Sigin_body({super.key});

  @override
  State<Sigin_body> createState() => _Sigin_bodyState();
}

class _Sigin_bodyState extends State<Sigin_body> {
  String? email, password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is Signinfailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SigninSuccess) {
          Get.to(
            () => const admin_main(),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('success  ')));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
            child: Form(
                key: formstate,
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.defaultSize! * 50,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.defaultSize! * 10,
                          ),
                          const Text(
                            ' Register now ',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Image.asset(Assets.imagesViewImageLogo),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Custmtextfield(
                      hinttext: S.of(context).email,
                      icon: Icons.email,
                      onSaved: (data) {
                        email = data;
                      },
                    ),
                    Custmtextfield(
                      hinttext: S.of(context).password,
                      icon: Icons.lock,
                      onSaved: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize,
                    ),
                    custom_button(
                      isloading: state is SigninLoading ? true : false,
                      text: S.of(context).registar,
                      color: Colors.blue,
                      onTap: () {
                        if (formstate.currentState!.validate()) {
                          formstate.currentState!.save();
                          BlocProvider.of<AuthCubit>(context)
                              .register(email: email!, password: password!);
                        }
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).haveaccount),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const loginPage(),
                            );
                          },
                          child: Text(
                            S.of(context).login,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  ],
                )));
      },
    );
  }
}
