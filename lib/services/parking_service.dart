import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/parking_model.dart'; // Importe o ParkingModel diretamente

class ParkingService {
  String url = "https://parking-spot-pmfd.onrender.com/parking-spot";
  dynamic _response;

  ParkingService() {
    _response = "";
  }

  // Retorna diretamente uma lista nativa de ParkingModel
  Future<List<ParkingModel>> fetchListParking() async {
    _response = await http.get(Uri.parse(url));

    if (_response.statusCode == 200) {
      // O JSON decodificado é uma List pura (JSArray no navegador)
      final List<dynamic> retorno = json.decode(_response.body);

      // Converte item por item da lista para o modelo correto
      return retorno.map((item) => ParkingModel.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao Carregar');
    }
  }
}
