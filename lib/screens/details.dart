import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';
import 'package:millenium/widgets/custom_button.dart';
import 'package:millenium/widgets/input_fields.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

enum SingingCharacter { lafayette, jefferson }

class _DetailsState extends State<Details> {

// ...

  SingingCharacter _character = SingingCharacter.lafayette;

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
            child: CustomText(msg: "Genero", color: grey, size: 20,),
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
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Categoria 1'),
                leading: Radio(
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() { _character = value; });
                  },
                ),
              ),
              ListTile(
                title: const Text('Categoria 2'),
                leading: Radio(
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() { _character = value; });
                  },
                ),
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
                    CustomText(msg: "Salvar", color: white, size: 22, weight: FontWeight.w600,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          CustomText(msg: "Esqueceu a palavra-passe", color: primary,),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: CustomText(msg: "Criar Conta", weight: FontWeight.w300,),
          ),

        ],
      ),
    );
  }

}
