import '../../const/constants.dart';

class productmodel {
  String name;
  String price;
  String description;
  String originalprice;
  String location;
  String amount;
  String? DocId;

  productmodel({
    required this.name,
    required this.price,
    required this.description,
    required this.originalprice,
    required this.location,
    required this.amount,
    this.DocId,
  });
  factory productmodel.fromJson(data, String id) {
    return productmodel(
      name: data[kProductname],
      price: data[kProductprice],
      description: data[kProductdescription],
      originalprice: data[kProductoriginalprice],
      location: data[kProductlocation],
      amount: data[kProductamount],
      DocId: id,
    );
  }
}
