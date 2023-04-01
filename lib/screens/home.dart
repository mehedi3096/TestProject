import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  _showSnackBar() {
    Get.snackbar("Hey There", "SnackBar is easy");
  }

  _showDialog() {
    Get.defaultDialog(title: "Simple Dialog", content: Text("To easy"));
  }

  _showBottomSheet() {
    Get.bottomSheet(
        Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text("Music Video"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Video"),
                leading: Icon(Icons.video_call),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My APP"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showSnackBar(),
              child: Text("SnackBar"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/testapi');
              },
              child: Text("Test Api"),
            ),
            ElevatedButton(
              onPressed: () => _showDialog(),
              child: Text("Dialog"),
            ),
            ElevatedButton(
              onPressed: () => _showBottomSheet(),
              child: Text("BottomSheet"),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
