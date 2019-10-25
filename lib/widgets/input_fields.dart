import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';

class InputFieldArea extends StatefulWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;
  InputFieldArea({this.hint, this.obscure, this.icon, this.controller});

  @override
  _InputFieldAreaState createState() => _InputFieldAreaState();
}

class _InputFieldAreaState extends State<InputFieldArea> {
  bool obscure;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscure = widget.obscure;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
          Border(bottom: BorderSide(width: 0.5, color: primary))),
      child: ListTile(
        title: TextFormField(
          controller: widget.controller,
          obscureText: obscure ?? false,
          style: const TextStyle(color: primary),
          decoration: InputDecoration(
              icon: Icon(widget.icon, color: primary),
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(color: primary),
//            contentPadding: EdgeInsets.only(
//                top: 30.0, right: 30.0, bottom: 10.0, left: 5.0)
          ),
          validator: (value){
            if(value.isEmpty){
              return "field cannot be empty";
            }
            if(widget.icon == Icons.alternate_email){
              if (value.isNotEmpty) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value))
                  return "Email format not valid";
                else
                  return null;
              }
            }
            if(widget.icon == Icons.person){
              if (value.isNotEmpty) {
                Pattern pattern = '^[a-zA-Z]+\$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value))
                  return "Use only letter for your name";
                else
                  return null;
              }
            }if(widget.icon == Icons.lock_outline){
              if(value.length < 6){
                return "Minimum of 6 characters required";
              }
            }
            return null;
          },
        ),
        trailing: Visibility(
          visible: widget.icon == Icons.lock_outline,
          child: GestureDetector(
              onTap: (){
                setState(() {
                  obscure = !obscure;
                });
              },
              child: obscure ?Icon(Icons.visibility_off) : Icon(Icons.visibility)),)
      ),
    );
  }
}
