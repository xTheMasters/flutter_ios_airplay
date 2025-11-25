import 'package:flutter/material.dart';
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
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(useMaterial3: true),
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
                  try {
                    await FlutterIosAirplay.url(
                      url: 'https://themonstersapp.com/bunny.mp4',
                    );
                    setState(() => errorMessage = null);
                  } catch (e) {
                    setState(() => errorMessage = e.toString());
                  }
                },
                child: const Text('Video Url'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FlutterIosAirplay.assets(
                      asset: 'assets/americano.mp4',
                    );
                    setState(() => errorMessage = null);
                  } catch (e) {
                    setState(() => errorMessage = e.toString());
                  }
                },
                child: const Text('Video Asset'),
              ),
              const SizedBox(height: 12),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
