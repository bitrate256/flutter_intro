import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.camera, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.paperplane, color: Colors.black),
            onPressed: () {},
          )
        ],
        title: Image.asset(
          'assets/logo.png',
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: images.length, // 이미지 개수만큼 보여주기
        itemBuilder: (context, index) {
          final image = images[index]; // index에 해당하는 이미지
          return Feed(imageUrl: image); // imageUrl 전달
        },
      ),
    );
  }
}

final List<String> images = [
  "https://cdn2.thecatapi.com/images/bi.jpg",
  "https://cdn2.thecatapi.com/images/63g.jpg",
  "https://cdn2.thecatapi.com/images/a3h.jpg",
  "https://cdn2.thecatapi.com/images/a9m.jpg",
  "https://cdn2.thecatapi.com/images/aph.jpg",
  "https://cdn2.thecatapi.com/images/1rd.jpg",
  "https://cdn2.thecatapi.com/images/805.gif",
];