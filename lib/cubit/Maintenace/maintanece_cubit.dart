import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elkhwaga_stor/Data/models/maintenacemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/constants.dart';

part 'maintanece_state.dart';

class MaintenaceCubit extends Cubit<MaintenaceState> {
  MaintenaceCubit() : super(MaintaneceInitial());
  Maintenacemodel? maintenacemodel;
  CollectionReference maintenace =
      FirebaseFirestore.instance.collection(kmaintenaceCollection);
  addMaintenace(Maintenacemodel model) {
    try {
      maintenace.add({
        kclientname: model.clientName,
        kProblemname: model.problemName,
        kstartdate: model.startdate,
        kenddate: model.enddate,
        kProblemprice: model.price,
        kpaidup: model.paidup,
      });
      emit(AddMaintanecesuccess());
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  loadMaintenace() async {
    List<Maintenacemodel> maintenacelist = [];
    var snapshot = await maintenace.get();
    for (var doc in snapshot.docs) {
      String id = doc.id;
      var data = doc.data();
      maintenacelist.add(Maintenacemodel.fromJson(data, id));
    }
    emit(LoadMaintanecesuccess(maintenacelist: maintenacelist));
  }

  updateMaintenace({required id, required Maintenacemodel Maintenacemodel}) {
    try {
      maintenace.doc(id).update({
        kclientname: Maintenacemodel.clientName,
        kProblemname: Maintenacemodel.problemName,
        kstartdate: Maintenacemodel.startdate,
        kenddate: Maintenacemodel.enddate,
        kProblemprice: Maintenacemodel.price,
        kpaidup: Maintenacemodel.paidup,
      });
      emit(UpdateMaintanecesuccess());
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteitem({required id}) {
    maintenace.doc(id).delete();
  }
}
