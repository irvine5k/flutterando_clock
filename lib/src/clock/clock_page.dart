import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

const minSecAngle = math.pi / 30;
const hourAngle = math.pi / 12;

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
          child: Center(
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: _now.second * minSecAngle,
                    alignment: Alignment.center,
                    child: Divider(
                      color: Colors.grey[100],
                      height: 20,
                      endIndent: 185,
                      indent: 100,
                      thickness: 2,
                    ),
                  ),
                  Transform.rotate(
                    angle: _now.hour * hourAngle,
                    alignment: Alignment.center,
                    child: Divider(
                      color: Colors.red,
                      height: 20,
                      endIndent: 185,
                      indent: 100,
                      thickness: 2,
                    ),
                  ),
                  Transform.rotate(
                    angle: _now.minute * minSecAngle,
                    alignment: Alignment.center,
                    child: Divider(
                      color: Colors.black,
                      height: 20,
                      endIndent: 185,
                      indent: 120,
                      thickness: 2,
                    ),
                  ),
                  Transform.rotate(
                    angle: _now.hour * hourAngle,
                    alignment: Alignment.center,
                    child: Divider(
                      color: Colors.black,
                      height: 20,
                      endIndent: 185,
                      indent: 120,
                      thickness: 2,
                    ),
                  ),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          spreadRadius: 10,
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
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
