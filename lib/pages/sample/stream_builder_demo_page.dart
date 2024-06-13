import 'package:flutter/material.dart';

class StreamBuilderDemoPage extends StatelessWidget {
  const StreamBuilderDemoPage({super.key});

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamBuilder"),
      ),
      body: Center(
          child: StreamBuilder<int>(
        stream: counter(), //
        //initialData: ,// a Stream<int> or null
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('没有Stream');
            case ConnectionState.waiting:
              return const Text('等待数据...');
            case ConnectionState.active:
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return const Text('Stream 已关闭');
          } // unreachable
        },
      )),
    );
  }
}
