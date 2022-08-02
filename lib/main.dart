import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.addListener(() {}); //can do something meanwhile is changing

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? _scale = 2;

  Color? _color = Colors.blue[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            setState(() {
              if (_scale != 2) {
                // _controller.forward();
                _controller.repeat();
                _scale = 2;
                _color = const Color.fromARGB(255, 112, 228, 29);
              } else {
                _controller.stop();
                _scale = 1;
                _color = const Color.fromARGB(255, 58, 29, 174);
              }
            });
          },
          //here! remember this
          child: AnimatedBuilder(
            animation: _controller.view,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: Container(
              width: 200,
              height: 200,
              color: _color,
              child: const Center(
                child: Text(
                  'Animation',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
