import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:millenium/providers/appState.dart';
import 'package:millenium/widgets/input_fields.dart';
import 'package:provider/provider.dart';

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
                if(_email.text.length > 2 && _password.text.length > 5) {
                  AppProvider app = Provider.of<AppProvider>(context);
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _password.text)
                      .then((result) {
                        app.changeIndex(0);
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text('Registado: ' + result.user.email),
                        ));
                      }).catchError((error) {
                        if (error.toString().contains('ERROR_EMAIL_ALREADY_IN_USE')) {
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text)
                              .then((result2) {
                            if(result2.user != null) {
                              app.changeIndex(0);
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text('Logado: ' + result2.user.email),
                              ));
                            }
                          })
                              .catchError((error){
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text(error.toString()),
                            ));
                          });
                        }
                      });
                }
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
