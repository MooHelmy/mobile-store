import '../../const/constants.dart';

class Maintenacemodel {
  String problemName;
  String price;
  String clientName;
  String paidup;
  String startdate;
  String enddate;
  String? doc_id;
  Maintenacemodel(
      {required this.clientName,
      required this.price,
      required this.problemName,
      required this.startdate,
      required this.enddate,
      required this.paidup,
      this.doc_id});
  factory Maintenacemodel.fromJson(data, id) {
    return Maintenacemodel(
        clientName: data[kclientname],
        price: data[kProblemprice],
        problemName: data[kProblemname],
        paidup: data[kpaidup],
        startdate: data[kstartdate],
        enddate: data[kenddate],
        doc_id: id);
  }
}
