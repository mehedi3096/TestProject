import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../screens/photo.dart';

class PhotoController extends GetxController {
  var photos = <Photo>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  void fetchPhotos() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        photos.value =
            jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
