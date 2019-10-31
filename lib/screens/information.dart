import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(imageProvider: AssetImage('images/banner.png'))
    );
  }

}
