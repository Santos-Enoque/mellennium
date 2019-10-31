import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:millenium/providers/appState.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:millenium/widgets/input_fields.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  String _uid;

  Details(String uid) {
    this._uid = uid;
  }

  @override
  _DetailsState createState() => _DetailsState();
}

enum Gender { M, F }
enum Category { Populares, Tricilo, Cadeirante, Federados, Pessoal, BIM, Caminhada }
enum ShirtSize { Pequena, Media, Grande, Extra_Grande }

class _DetailsState extends State<Details> {

  ShirtSize _shirtSize = ShirtSize.Pequena;
  Gender _gender = Gender.M;
  Category _categorias = Category.Populares;

  String _chosenCategory = 'Populares';
  String _chosenShirt = 'Pequena';
  int _chosenCategoryIndex = 0;
  int _chosenShirtIndex = 0;

  TextEditingController _person_name = TextEditingController(text: '');
  TextEditingController _surname = TextEditingController(text: '');
  TextEditingController _age = TextEditingController(text: '');
  TextEditingController _phone = TextEditingController(text: '');
  TextEditingController _nationality = TextEditingController(text: '');
  TextEditingController _passport = TextEditingController(text: '');

  String _top_text = 'Por favor, preencha o formulário abaixo para terminar'
      ' o seu registro';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(_top_text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Nome", controller: _person_name, icon: Icons.person_outline, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Apelido", controller: _surname, icon: Icons.people_outline, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Idade", controller: _age, icon: Icons.calendar_today, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: CustomText(msg: "Genero", color: black, size: 20,),
          ),
          SizedBox(height: 20,),
          Wrap(
            children: <Widget>[
              ListTile(
                title: const Text('Masculino'),
                leading: Radio(
                  value: Gender.M,
                  groupValue: _gender,
                  onChanged: (Gender value) {
                    setState(() { _gender = value; });
                  },
                ),
              ),
              ListTile(
                title: const Text('Feminino'),
                leading: Radio(
                  value: Gender.F,
                  groupValue: _gender,
                  onChanged: (Gender value) {
                    setState(() { _gender = value; });
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Telefone", controller: _phone, icon: Icons.contact_phone, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Nacionalidade", controller: _nationality, icon: Icons.flag, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "BI/Passaporte", controller: _passport, icon: Icons.subtitles, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: CustomText(msg: "Categoria", color: black, size: 20,),
          ),
          Wrap(
            children: <Widget>[
              ListTile(
                title: const Text('Populares'),
                leading: Radio(
                  value: Category.Populares,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Populares';
                      _chosenCategoryIndex = 0;
                      _categorias = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Deficientes Triciclos'),
                leading: Radio(
                  value: Category.Tricilo,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Deficientes Triciclos';
                      _chosenCategoryIndex = 1;
                      _categorias = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Deficientes Cadeirantes'),
                leading: Radio(
                  value: Category.Cadeirante,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Deficientes Cadeirantes';
                      _chosenCategoryIndex = 2;
                      _categorias = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Federados'),
                leading: Radio(
                  value: Category.Federados,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Federados';
                      _chosenCategoryIndex = 3;
                      _categorias = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Pessoal do BIM'),
                leading: Radio(
                  value: Category.Pessoal,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Pessoal do BIM';
                      _chosenCategoryIndex = 4;
                      _categorias = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Reformado do BIM'),
                leading: Radio(
                  value: Category.BIM,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Reformados do BIM';
                      _chosenCategoryIndex = 5;
                      _categorias = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Caminhada'),
                leading: Radio(
                  value: Category.Caminhada,
                  groupValue: _categorias,
                  onChanged: (Category value) {
                    setState(() {
                      _chosenCategory = 'Caminhada';
                      _chosenCategoryIndex = 6;
                      _categorias = value; });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: CustomText(msg: "Camiseta", color: black, size: 20,),
          ),
          Wrap(
            children: <Widget>[
              ListTile(
                title: const Text('Pequena'),
                leading: Radio(
                  value: ShirtSize.Pequena,
                  groupValue: _shirtSize,
                  onChanged: (ShirtSize value) {
                    setState(() {
                      _chosenShirt = 'Pequena';
                      _chosenShirtIndex = 0;
                      _shirtSize = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Média'),
                leading: Radio(
                  value: ShirtSize.Media,
                  groupValue: _shirtSize,
                  onChanged: (ShirtSize value) {
                    setState(() {
                      _chosenShirt = 'Média';
                      _chosenShirtIndex = 1;
                      _shirtSize = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Grande'),
                leading: Radio(
                  value: ShirtSize.Grande,
                  groupValue: _shirtSize,
                  onChanged: (ShirtSize value) {
                    setState(() {
                      _chosenShirt = 'Grande';
                      _chosenShirtIndex = 2;
                      _shirtSize = value; });
                  },
                ),
              ),
              ListTile(
                title: const Text('Extra Grande'),
                leading: Radio(
                  value: ShirtSize.Extra_Grande,
                  groupValue: _shirtSize,
                  onChanged: (ShirtSize value) {
                    setState(() {
                      _chosenShirt = 'Extra Grande';
                      _chosenShirtIndex = 3;
                      _shirtSize = value;
                    });
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: RaisedButton(
              onPressed: (){
                if(isInvalid(_person_name, 3) || isInvalid(_surname, 3) ||
                   isInvalid(_age, 2) || isInvalid(_phone, 5) ||
                    isInvalid(_nationality, 3) || isInvalid(_passport, 5)) {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text('Um dos campos é inválido'),
                  ));
                  return;
                }

                DocumentReference userRef = Firestore.instance.collection('participants')
                    .document(widget._uid);
                userRef.updateData({
                  'name': _person_name.text,
                  'surname': _surname.text,
                  'age': int.parse(_age.text),
                  'contact': int.parse(_phone.text),
                  'nationality': _nationality.text,
                  'documentNr': _passport.text,
                  'gender': _gender == Gender.M ? 'M' : 'F',
                  'chosenCategory': _chosenCategory,
                  'chosenCategoryIndex': _chosenCategoryIndex,
                  'chosenShirtIndex': _chosenShirtIndex,
                  'chosenShirt': _chosenShirt,
                }).then((v) {
                  AppProvider app = Provider.of<AppProvider>(context);
                  app.changeIndex(0);
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text('Dados Guardados!'),
                  ));
                });
              },
              textColor: Colors.white,
              color: Colors.pink,
              child: Text('Salvar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: FlatButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                AppProvider app = Provider.of<AppProvider>(context);
                app.changeIndex(0);
              },
              textColor: Colors.pink,
              child: Text('Sair (log out)'),
            ),
          ),

        ],
      ),
    );
  }

  bool isInvalid(TextEditingController controller, int limit) {
    return controller.text.length < limit;
  }

  void getProfile() async {
    String uid = widget._uid;
    DocumentSnapshot snapshot = await Firestore.instance.collection('participants')
        .document(uid).get();
    setState(() {
      _person_name.text = snapshot.data['name'];
      _surname.text = snapshot.data['surname'];
      _age.text = snapshot.data['age'] != null ? snapshot.data['age'].toString() : "";
      _phone.text = snapshot.data['contact'] != null ? snapshot.data['contact'].toString() : "";
      _nationality.text = snapshot.data['nationality'];
      _passport.text = snapshot.data['documentNr'];
      if (snapshot.data['gender'] == 'M') {
        _gender = Gender.M;
      } else {
        _gender = Gender.F;
      }
      if(snapshot.data['chosenCategoryIndex'] != null) {
        _chosenCategoryIndex = snapshot.data['chosenCategoryIndex'];
        _chosenCategory = snapshot.data['chosenCategory'];
        _categorias = Category.values[_chosenCategoryIndex];
        if (snapshot.data['participating'] == true) {
          _top_text = 'Você está registado na categoria ' + _chosenCategory +
              ' com o número ' + snapshot.data['dorsal'];
        }
      }
      if(snapshot.data['chosenShirtIndex'] != null) {
        _chosenShirtIndex = snapshot.data['chosenShirtIndex'];
        _chosenShirt = snapshot.data['chosenShirt'];
        _shirtSize = ShirtSize.values[_chosenShirtIndex];
      }
    });
  }

  @override
  void initState() {
    getProfile();
  }

}
