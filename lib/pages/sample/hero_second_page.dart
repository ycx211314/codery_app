import 'package:flutter/material.dart';

class HeroSecondPage extends StatefulWidget {
  const HeroSecondPage({super.key});

  @override
  State<HeroSecondPage> createState() => _HeroSecondPageState();
}

class _HeroSecondPageState extends State<HeroSecondPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("hero预览"),
        ),
        body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              children: <Widget>[
                Hero(
                  tag: "xx",
                  child: Image.network(
                      "https://d-ssl.dtstatic.com/uploads/blog/202204/13/20220413091711_29352.thumb.1000_0.jpg_webp"),
                ),
                const Text("预览图片",
                    style: TextStyle(
                        decoration: TextDecoration.none, fontSize: 20)),
              ],
            )));
  }
}
