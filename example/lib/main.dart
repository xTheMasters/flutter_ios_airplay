import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_ios_airplay/flutter_ios_airplay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await FlutterIosAirplay.url(
                      url: 'https://themonstersapp.com/americano.mp4');
                },
                child: Text('Video'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FlutterIosAirplay.assets(
                      assets: 'assets/americano.mp4');
                },
                child: Text('Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
