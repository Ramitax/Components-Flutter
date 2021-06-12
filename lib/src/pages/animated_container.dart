import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainterPage extends StatefulWidget {
  @override
  _AnimatedContainterPageState createState() => _AnimatedContainterPageState();
}

class _AnimatedContainterPageState extends State<AnimatedContainterPage> {
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container")),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInSine,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cached_outlined),
        onPressed: _changeForm,
      ),
    );
  }

  void _changeForm() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _heigth = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
