import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:millenium/widgets/input_fields.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

enum Gender { M, F }
enum Category { Populares, Tricilo, Cadeirante, Federados, Pessoal, BIM, Caminhada }
enum ShirtSize { Pequena, Media, Grande, Extra_Grande }

class _DetailsState extends State<Details> {

// ...

  ShirtSize _shirtSize = ShirtSize.Pequena;
  Gender _gender = Gender.M;
  Category _categorias = Category.Populares;

  String _chosenCategory = 'Populares';
  String _chosenShirt = 'Pequena';
  int _chosenCategoryIndex = 0;
  int _chosenShirtIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: <Widget>[

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Nome", controller: null, icon: Icons.person_outline, obscure: false,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Apelido", controller: null, icon: Icons.people_outline, obscure: true,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Idade", controller: null, icon: Icons.calendar_today, obscure: true,),
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
            child: InputFieldArea(hint: "Telefone", controller: null, icon: Icons.contact_phone, obscure: true,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "Nacionalidade", controller: null, icon: Icons.flag, obscure: true,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: InputFieldArea(hint: "BI/Passaporte", controller: null, icon: Icons.subtitles, obscure: true,),
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

              },
              textColor: Colors.pink,
              child: Text('Sair (log out)'),
            ),
          ),

        ],
      ),
    );
  }

}
