import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/photo_controller.dart';
import 'photo.dart';

class GetPhotoList extends StatelessWidget {
  final controller = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo List'),
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.photos.length,
                  itemBuilder: (context, index) {
                    final photo = controller.photos[index];
                    return ListTile(
                      leading: Image.network(photo.thumbnailUrl),
                      title: Text(photo.title),
                      subtitle: Text('Album ID: ${photo.albumId}'),
                      onTap: () {
                        Get.snackbar("Index : ${index + 1}", "${photo.title}");
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
