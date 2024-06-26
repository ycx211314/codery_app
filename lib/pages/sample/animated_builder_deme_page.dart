import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuilderPageState();
  }
}

class BuilderPageState extends State<BuilderPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    var tween = Tween(begin: 20.0, end: 100.0).animate(controller);
    return Scaffold(
      appBar: AppBar(
        title: const Text('fade'),
      ),
      body: AnimatedBuilder(
          animation: tween,
          child: Text('${tween.value}'),
          builder: (context, child) {
            print(controller.value);
            print(tween.value);
            return Container(
              child: Column(
                children: [
                  TextButton(
                    child: const Text('btn'),
                    onPressed: () {
                      controller.forward();
                    },
                  ),
                  Text('${tween.value} from 2'),
                  child!
                ],
              ),
            );
          }),
    );
  }
}
