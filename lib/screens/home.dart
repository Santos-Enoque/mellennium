import 'package:flutter/material.dart';
import 'package:millenium/providers/appState.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AppProvider app = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Corrida Millennium BIM"),
      ),
      body: app.body(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: app.index,
          onTap: (int index) {
            app.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("Informação")),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text("Agenda")),
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Mapa")),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text("Registo")),
      ]),
    );
  }
}
