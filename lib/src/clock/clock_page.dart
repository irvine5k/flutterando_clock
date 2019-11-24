import 'dart:async';

import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime _now;
  Timer _timer;

  @override
  void initState() {
    _updateTime();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCircularClock(),
        ],
      ),
    );
  }

  AspectRatio buildCircularClock() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 50,
              spreadRadius: 10,
            ),
          ],
        ),
        child: AspectRatio(
          aspectRatio: 2,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
    });
    _timer = Timer(Duration(seconds: 1), _updateTime);
  }
}
