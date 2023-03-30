import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mahatab_app/screens/opensea_model.dart';
import 'package:http/http.dart' as http;

class OpenSeaController extends GetxController {
  var isLoading = true.obs;
  OpenseaModel? openseaModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.opensea.io/api/v1/assets?collection=cryptopunks'));

    if (response.statusCode == 200) {
      try {
        var result = jsonDecode(response.body);
        openseaModel = OpenseaModel.fromJson(result);
      } catch (e) {
        print(e.toString());
      }
      isLoading(false);
      update();
    } else {
      Get.snackbar("Error", "Error retrieve data");
    }
  }
}
