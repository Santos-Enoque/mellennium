import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:millenium/widgets/input_fields.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Millennium"),
      ),
      backgroundColor: white,
      body: Form(
        child: ListView(
          children: <Widget>[

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InputFieldArea(hint: "Name", controller: null, icon: Icons.person_outline, obscure: false,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InputFieldArea(hint: "Surname", controller: null, icon: Icons.people_outline, obscure: true,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InputFieldArea(hint: "Age", controller: null, icon: Icons.calendar_today, obscure: true,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: CustomText(msg: "Select gender", color: grey, size: 20,),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 220,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: grey[400],
                                offset: Offset(2, 1),
                                blurRadius: 3
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset("images/female.png", width: 160, height: 160,),
                          CustomText(msg: "Female", size: 28, color: grey,)
                        ],
                      )),
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primary
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(msg: "Login", color: white, size: 22, weight: FontWeight.w600,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            CustomText(msg: "Forgot password", color: primary,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: CustomText(msg: "Create account", weight: FontWeight.w300,),
            ),

          ],
        ),
      ),
    );
  }
}
