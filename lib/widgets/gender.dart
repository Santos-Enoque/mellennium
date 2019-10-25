import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';

class Gender extends StatelessWidget {
  final String image;
  final String name;

  Gender({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 220,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: primary[500],
                    offset: Offset(2, 1),
                    blurRadius: 3
                )
              ]
          ),
          child: Column(
            children: <Widget>[
              Image.asset("images/male.png", width: 160, height: 160,),
              CustomText(msg: "Male", size: 28, color: grey,)
            ],
          )),
    );
  }
}
