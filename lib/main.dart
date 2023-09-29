import 'package:flutter/material.dart';
import 'package:kosmos/routes/home.dart';
import 'package:device_preview/device_preview.dart';


void main(){
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const App(), // Wrap your app
  ),);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}