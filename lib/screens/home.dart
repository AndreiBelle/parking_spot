import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importação recomendada e unificada
import 'package:parking_spot/controllers/list_parking_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ListParkingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ListParkingController());
    controller.listParkings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: controller.listParkingObs.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.listParkingObs[index];

          return Card(
            child: ListTile(
              onTap: () {},
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/p.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                "${item.parkingSpotNumber} | ${item.licensePlateCar}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${item.brandCar} ${item.modelCar}\n${item.responsibleName} • Ap: ${item.apartment}, Bloco: ${item.block}",
              ),
            ),
          );
        },
      )),
    );
  }
}
