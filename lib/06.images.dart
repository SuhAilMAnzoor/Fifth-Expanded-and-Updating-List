import 'package:flutter/material.dart';

class ImagesInDart extends StatefulWidget {
  const ImagesInDart({super.key});

  @override
  State<ImagesInDart> createState() => _ImagesInDartState();
}

class _ImagesInDartState extends State<ImagesInDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //Network Image
          Image.network(
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg", // from Internet
          ),

          // Network Asset Image
        Image.asset("assets/images/image2.jpg",   // stored locally at assets/images folder
            width: 100,
            height: 200,
          ),

        ],
      )),
    );
  }
}
