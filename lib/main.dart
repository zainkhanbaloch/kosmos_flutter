import 'package:flutter/material.dart';
import 'package:kosmos/routes/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:kosmos/routes/about.dart';
import 'package:kosmos/routes/blog.dart';
import 'package:kosmos/routes/front.dart';
import 'package:kosmos/routes/mars.dart';
import 'package:kosmos/routes/news.dart';

// void main(){
//   runApp(DevicePreview(
//     enabled: true,
//     builder: (context) => const App(), // Wrap your app
//   ),);
// }

void main(){
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Home(),
      initialRoute: '/',
      routes: {
        // '/': (context) => Home(),
        '/mars': (context) => Mars(),
        '/news': (context) => News(),
        '/blog': (context) => Blog(),
      },
    );
  }
}