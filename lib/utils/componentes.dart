import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes {

  static rotulo(String rotulo) { // cria um método de rotulo para facilitar
    return Text(
      rotulo,
      style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 18),
    );
  }

  static caixaDeTexto(String rotulo, String dica, TextEditingController controlador, validacao, {bool obscure = false, bool numero = false}) {
    return TextFormField(
      controller: controlador,
      obscureText: obscure,
      validator: validacao,
      keyboardType: numero?TextInputType.number:TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.bold),
        hintText: dica,
        hintStyle: TextStyle(fontSize: 18, color: Colors.black38),
      ),
    );
  }
}