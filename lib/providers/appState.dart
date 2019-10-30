import 'package:flutter/material.dart';
import 'package:millenium/screens/details.dart';
import 'package:millenium/screens/information.dart';
import 'package:millenium/screens/map.dart';
import 'package:millenium/screens/schedule.dart';
import 'package:millenium/widgets/custom_button.dart';

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
        return Details();
    }
  }

}