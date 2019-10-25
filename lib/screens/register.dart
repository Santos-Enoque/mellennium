import 'package:flutter/material.dart';
import 'package:millenium/screens/login.dart';
import 'package:millenium/services/common.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:millenium/widgets/input_fields.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Millennium"),
      ),
      backgroundColor: white,
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/mil.png", width: 280,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: InputFieldArea(hint: "Email", controller: _email, icon: Icons.alternate_email, obscure: false,),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: InputFieldArea(hint: "Password", controller: _password, icon: Icons.lock_outline, obscure: true,),
              ),
              SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width - 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primary
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(msg: "Register", color: white, size: 22, weight: FontWeight.w600,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              CustomText(msg: "Forgot password", color: primary,),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    changeScreen(context, Login());
                  },
                  child: CustomText(msg: "if already have an account click here", weight: FontWeight.w300,))

            ],
          ),
        ),
      ),
    );
  }
}
