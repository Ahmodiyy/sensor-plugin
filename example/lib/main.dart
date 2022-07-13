import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hands_on_flutter_plugin/hands_on_flutter_plugin.dart';
import 'package:hands_on_flutter_plugin/hands_on_flutter_plugin_method_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  double _barometerReadings = 0;
  final _handsOnFlutterPlugin = HandsOnFlutterPlugin();
  final _barometer = MethodChannelHandsOnFlutterPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    double barometerValue;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _handsOnFlutterPlugin.getPlatformVersion() ??
          'Unknown platform version';
      barometerValue = await _barometer.getBarometer() ?? 0;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      barometerValue = 0;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _barometerReadings = barometerValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('your barometer reading is: $_barometerReadings\n'),
        ),
      ),
    );
  }
}