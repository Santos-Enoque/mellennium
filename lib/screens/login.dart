import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:millenium/widgets/input_fields.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Registe-se abaixo para participar da corrida', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InputFieldArea(hint: "Email", controller: _email, icon: Icons.alternate_email, obscure: false,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InputFieldArea(hint: "Senha", controller: _password, icon: Icons.lock_outline, obscure: true,),
            ),
            SizedBox(height: 40,),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              child: Text('Registar'),
              onPressed: () {

              },
            ),
            FlatButton(
              textColor: Colors.pink,
              child: Text('Esqueci a senha'),
              onPressed: () {

              },
            ),

          ],
        ),
      ),
    );
  }
}
