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

class _MyHomePageState extends State<MyHomePage> {
  double _width = 200;
  double _height = 200;
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
              if (_width != 400) {
                _width = 400;
                _height = 400;
                _color = const Color.fromARGB(255, 112, 228, 29);
              } else {
                _width = 200;
                _height = 200;
                _color = const Color.fromARGB(255, 58, 29, 174);
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: _width,
            height: _height,
            color: _color,
            curve: Curves.bounceOut,
            child: const Center(
              child: Text(
                'Animation',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
