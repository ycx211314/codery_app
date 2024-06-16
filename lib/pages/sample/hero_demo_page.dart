import 'package:codery/pages/sample/hero_second_page.dart';
import 'package:flutter/material.dart';

class HeroDemoPage extends StatefulWidget {
  const HeroDemoPage({super.key});

  @override
  State<HeroDemoPage> createState() => _HeroDemoPageState();
}

class _HeroDemoPageState extends State<HeroDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("hero page"),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HeroSecondPage()),
            );
          },
          child: Center(
              child: Hero(
                  tag: "xx",
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Image.network(
                        "https://d-ssl.dtstatic.com/uploads/blog/202204/13/20220413091711_29352.thumb.1000_0.jpg_webp"),
                  ))),
        ));
  }
}
