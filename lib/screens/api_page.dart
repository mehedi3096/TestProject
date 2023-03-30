import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mahatab_app/controller/opensea_controller.dart';
import 'package:mahatab_app/screens/opensea_model.dart';

class ApiPage extends StatelessWidget {
  OpenSeaController openSeaController = Get.put(OpenSeaController());
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Page"),
        centerTitle: true,
      ),
      body: Obx(() => openSeaController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: openSeaController.openseaModel?.assets?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      openSeaController.openseaModel?.assets![index].name ??
                          'NO Name'),
                  subtitle: Text(openSeaController
                          .openseaModel?.assets![index].description ??
                      "NO Description"),
                  leading:
                      openSeaController.openseaModel?.assets![index].imageUrl ==
                              null
                          ? Icon(Icons.image)
                          : Image.network(openSeaController
                              .openseaModel!.assets![index].imageUrl!),
                );
              },
            )),
    );
  }
}
