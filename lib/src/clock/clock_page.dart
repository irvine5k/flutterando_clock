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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
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
