import 'package:parking_spot/models/parking_model.dart';

class ListParkingModel {
  final List<ParkingModel> listParkingModel;

  ListParkingModel(this.listParkingModel);

  ListParkingModel.fromJson(Map<String, dynamic> json):
      listParkingModel = List.from(json.values).map((item) => ParkingModel.fromJson(item)).toList();
}