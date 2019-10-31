import 'package:flutter/material.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  String title = "", text = "";

  @override
  Widget build(BuildContext context) {
    if (title == '') {
      return Center(
        child: CircularProgressIndicator(
          value: null,
        ),
      );
    }
    return Center(
      child: SingleChildScrollView(
        child :Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: CustomText(msg: title, color: Colors.pink,),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(text)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getText() async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('ui')
        .document('homepage').get();
    setState(() {
      title = snapshot.data['informationCards'][0]['title_pt'].replaceAll("\\n", "\n");
      text = snapshot.data['informationCards'][0]['body_pt'].replaceAll("\\n", "\n");
    });
  }

  @override
  void initState() {
    getText();
  }

}
