import 'package:flutter/material.dart';
import 'package:millenium/screens/details.dart';
import 'package:millenium/screens/information.dart';
import 'package:millenium/screens/login.dart';
import 'package:millenium/screens/map.dart';
import 'package:millenium/screens/schedule.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppProvider with ChangeNotifier{
  int _index = 0;

//  getters
  int get index => _index;

//  methods
  changeIndex(int index){
    _index = index;
    notifyListeners();
  }

  Widget body(){
    switch(_index){
      case 0:
        return Information();
      case 1:
        return Schedule();
      case 2:
        return RouteMap();
      default:
        return new StreamBuilder(
            stream: FirebaseAuth.instance.currentUser().asStream(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
              if(snapshot.data != null) {
                return Details(snapshot.data.uid);
              }
              return Login();
            }
        );
    }
  }


}