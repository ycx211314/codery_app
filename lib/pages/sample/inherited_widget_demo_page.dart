import 'package:flutter/material.dart';

class InheritedWidgetDemoPage extends StatelessWidget {
  const InheritedWidgetDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('InheritedWidget Demo'),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyInheritedWidget extends InheritedWidget {
  final HomePageState data;

  const _MyInheritedWidget(this.data,
      {required super.child, required HomePageState ds});

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return true;
  }
}

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

  static HomePageState of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return context
          .dependOnInheritedWidgetOfExactType<_MyInheritedWidget>()!
          .data;
    }
    return context.findAncestorWidgetOfExactType<_MyInheritedWidget>()!.data;
    // or
    // return (context.getElementForInheritedWidgetOfExactType<_MyInheritedWidget>().widget as _MyInheritedWidget).data;
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  void _incrementCounter() {
    print('HomePageState before _incrementCounter counter $counter');
    setState(() {
      counter++;
      print('HomePageState counter $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(
      this,
      ds: this,
      child: widget.child,
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageState state = HomePage.of(context);

    return Center(
      child: Text(
        '${state.counter}',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('I am a widget that will not be rebuilt.');
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageState state = HomePage.of(context, rebuild: false);

    return FilledButton(
      onPressed: () {
        state._incrementCounter();
      },
      child: const Icon(Icons.add),
    );
  }
}
