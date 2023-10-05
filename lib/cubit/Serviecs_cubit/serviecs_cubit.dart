import 'dart:io';

import 'package:elkhwaga_stor/Data/models/productsmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../const/constants.dart';

part 'serviecs_state.dart';

class ServiecsCubit extends Cubit<ServiecsState> {
  ServiecsCubit() : super(ServiecsInitial());
  productmodel? modelproduct;

  CollectionReference Products =
      FirebaseFirestore.instance.collection(kProductCollection);

  Add_product({required productmodel model}) {
    Products.add({
      kProductname: model.name,
      kProductprice: model.price,
      kProductdescription: model.description,
      kProductoriginalprice: model.originalprice,
      kProductlocation: model.location,
      kProductamount: model.amount
    });
    emit(Addproudctsucess());
  }

  loadProduct() async {
    List<productmodel> listproduct = [];
    var snapshot = await Products.get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      String id = doc.id;
      listproduct.add(productmodel.fromJson(data, id));
    }
    emit(Getproudctsuccess(listproduct));
  }

  updateProduct({required productmodel model, id}) {
    emit(Addproudctloading());
    try {
      Products.doc(id).update({
        kProductname: model.name,
        kProductprice: model.price,
        kProductdescription: model.description,
        kProductoriginalprice: model.originalprice,
        kProductlocation: model.location,
        kProductamount: model.amount,
      });
      emit(Updatesuccess());
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteproduct(id) {
    Products.doc(id).delete();
  }

  uploadImage({required File image}) async {
    Reference storage =
        FirebaseStorage.instance.ref().child(basename(image.path));
    UploadTask uploadTask = storage.putFile(image);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    String url = await snapshot.ref.getDownloadURL();
    emit(ImageCubitSuccess(url: url));
  }
}
