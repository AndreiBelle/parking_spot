import 'package:get/get.dart'; // Importação limpa unificada do GetX
import '../models/parking_model.dart';
import '../services/parking_service.dart';

class ListParkingController extends GetxController {
  final ParkingService parkingService = ParkingService();

  var isLoading = false.obs;
  var listParkingObs = <ParkingModel>[].obs;

  static ListParkingController get listParking => Get.find();

  Future<List<ParkingModel>> listParkings() async {
    try {
      isLoading.value = true;

      // Obtém a lista tipada diretamente do serviço
      final list = await parkingService.fetchListParking();

      // Atualiza o estado reativo limpando e reinserindo os dados de uma vez só
      listParkingObs.assignAll(list);
    } catch (e) {
      print("Erro ao processar dados do estacionamento: $e");
    } finally {
      isLoading.value = false;
    }

    return listParkingObs;
  }
}
