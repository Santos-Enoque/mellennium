import 'package:flutter/material.dart';
import 'package:millenium/providers/appState.dart';
import 'package:millenium/screens/register.dart';
import 'package:millenium/services/common.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
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
        title: Text("Millennium"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person_outline), onPressed: (){
            changeScreen(context, Register());
          })
        ],
      ),
      
      drawer: Drawer(
        child: ListView(),
      ),
      body: app.body(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: app.index,
          onTap: (int index) {
            app.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("Information")),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text("Information")),
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Information")),
      ]),
    );
  }
}
