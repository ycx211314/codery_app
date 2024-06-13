import 'package:flutter/material.dart';

class FadeInImagePage extends StatelessWidget {
  const FadeInImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FadeInImagePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'), // 占位符图片
          image: NetworkImage('https://picsum.photos/250?random'), // 网络图片
          fadeInDuration: Duration(milliseconds: 500), // 淡入持续时间
          fit: BoxFit.cover, // 适应图片的方式
        ),
      ),
    );
  }
}
