import 'package:intl/intl.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'dart:async';
import 'package:flutter/material.dart';

void initializeTimeZones() {
  tz.initializeTimeZones();
}

String getCurrentDate(String countryName) {
  initializeTimeZones();
  final location = tz.getLocation(countryName);
  final now = tz.TZDateTime.now(location);
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

String getCurrentTime(String countryName) {
  initializeTimeZones();
  final location = tz.getLocation(countryName);
  final now = tz.TZDateTime.now(location);
  final formatter = DateFormat('HH:mm:ss');
  return formatter.format(now);
}

class TimeDisplay extends StatefulWidget {
  final String countryName;

  const TimeDisplay({super.key, required this.countryName});

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _currentTime = getCurrentTime(widget.countryName);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_currentTime,
        style: TextStyle(
            fontFamily: "mydotFont",
            fontSize: ScreenUtils.getWidth(context) * 0.07,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 255, 17)));
  }
}
