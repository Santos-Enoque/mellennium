import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_file.dart';

class Schedule extends StatefulWidget {

  @override
  _ScheduleState createState() => _ScheduleState();

}

class _ScheduleState extends State<Schedule> {

  DocumentSnapshot schedule;

  @override
  Widget build(BuildContext context) {
    if (schedule == null) {
      return Center(
        child: CircularProgressIndicator(
          value: null,
        ),
      );
    }
    return ListView.builder(
      itemCount: (schedule['sessions'] as List).length,
        itemBuilder: (_, int index) {
          return _buildSessionItem(schedule, index);
        });
  }

  Widget _buildSessionItem(DocumentSnapshot data, int index) {
    if (data == null) {
      return Text('A carregar');
    }
    String dateTime = data['sessions'][index]['dateTime'];
    bool firstSession = data['sessions'][index]['firstSessionOfDay'];
    String location = '';
    String title = data['sessions'][index]['title_pt'];
    int month = int.parse(dateTime.substring(4, 6));
    int day = int.parse(dateTime.substring(6, 8));
    String hourString = dateTime.substring(8, 10);
    String minuteString = dateTime.substring(10, 12);

    var date = new DateTime(2019, month, day);
    String monthString = DateFormat.MMMM().format(date);
    String dayString = DateFormat.d().format(date);

    if(data['sessions'][index]['location_pt'] != null) {
      location = data['sessions'][index]['location_pt'];
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Visibility(
          visible: firstSession,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(dayString + ' de ' + monthString, style: TextStyle(fontSize: 24),)
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: <Widget>[
                Text(
                  hourString + ':' + minuteString,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(title, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)
                ),
              ],
            )
        ),
        Visibility(
          visible: location != '',
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(location)
          ),
        )
      ],
    );
  }

  void getSchedule() async {
    DocumentSnapshot snapshot = await Firestore.instance.collection('ui')
        .document('schedule').get();
    setState(() {
      schedule = snapshot;
    });
  }



  @override
  void initState() {
    getSchedule();
  }

}
