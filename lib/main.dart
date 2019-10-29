import 'package:flutter/material.dart';
import 'package:millenium/providers/appState.dart';
import 'package:millenium/screens/details.dart';
import 'package:millenium/screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider.value(value: AppProvider()),
],
child: MyApp(),));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Millennium Corrida',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home()
    );
  }
}
