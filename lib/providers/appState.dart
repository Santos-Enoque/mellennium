import 'package:flutter/material.dart';
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
        return CustomText(msg: "Information",);
      case 1:
        return CustomText(msg: "Schedule",);
      case 2:
        return CustomText(msg: "Maps",);
      default:
        return CustomText(msg: "Default",);
    }
  }

}