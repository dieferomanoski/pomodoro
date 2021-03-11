import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/utils/colors.dart';


class AppText extends StatelessWidget {
  final String label;
  final String hint;
  final Function validator;
  final dynamic onSaved;
  final bool password;
  final TextEditingController controller;
  final TextInputType typeInput;
  final Icon icon;
  final bool readOnly;


  AppText(this.label, this.hint,
      {this.validator, this.onSaved, this.password = false,this.controller,this.typeInput = TextInputType.text, this.icon,this.readOnly =false});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      
      child: TextFormField(
        readOnly: this.readOnly,
        controller: this.controller,
        validator: this.validator,
        onSaved: this.onSaved,
        obscureText: password,
        keyboardType: typeInput,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        decoration: InputDecoration(    
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(14)
            ),
            prefixIcon: icon ?? null,      
            labelText: this.label,
            labelStyle: TextStyle(
                color: Colors.black38, fontSize: 14, fontWeight: FontWeight.bold,fontFamily: 'Montserrat-Regular'),
            hintText: this.hint,
            hintStyle: TextStyle(  
              color: Colors.grey,
              fontSize: 12,
              fontFamily: 'Montserrat-Regular'      
            ),
             errorStyle: TextStyle(fontSize: 12,fontFamily: 'Montserrat-Regular')),
      ),
    );
  }
}