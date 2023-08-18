import 'package:flutter/material.dart';
import 'package:loacal_notes/src/res/string.dart';
import 'package:loacal_notes/src/view/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppString.appName,
      theme: ThemeData(useMaterial3: true),
      home: const HomeView(),
    );
  }
}
