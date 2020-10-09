import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:weather_app/utils/componentes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controladorCidade = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  // colocar as strings
  String temperatura = "Temperatura";
  String data = "Data";
  String tempo = "Tempo";
  String descricao = "Descrição";
  String atualmente = "Atualmente";
  String cidade = "Cidade";
  String umidade = "Umidade";
  String velocVento = "Velocidade do vento";
  String nascDoSol = "Nascer do Sol";
  String porDoSol = "Por do Sol";
  String cidadeNome = "Nome da Cidade";

  Function validaCidade = ((value) {
    if(value.isEmpty)
      return "Você deve informar a cidade";
  });

  clicouNoBotao() async{
    if(!cForm.currentState.validate())
      return;
    String url = "https://api.hgbrasil.com/weather?key=4958a6dd";
    Response resposta = await get(url);
    Map clima = json.decode(resposta.body);

    setState(() {
      // colocar as Strings
      temperatura   = "temperatura atual em ºC: " + clima["results"]["temp"].toString() + "ºC";
      data          = "data da consulta: " + clima["results"]["date"].toString();
      tempo         = "hora da consulta: " + clima["results"]["time"].toString();
      descricao     = "condição de tempo atual: " + clima["results"]["description"].toString();
      atualmente    = "dia ou noite: " + clima["results"]["currently"].toString();
      cidade        = "identificador da cidade: " + clima["results"]["city"].toString();
      umidade       = "umidade atual em percentual: " + clima["results"]["humidity"].toString();
      velocVento    = "velocidade do vento em km/h: " + clima["results"]["wind_speedy"].toString() + "km/h";
      nascDoSol     = "nascer do sol em horário local da cidade: " + clima["results"]["sunrise"].toString();
      porDoSol      = "pôr do sol em horário local da cidade: " + clima["results"]["sunset"].toString();
      cidadeNome    = "nome da cidade: " + clima["results"]["city_name"].toString();

    });

    print(clima);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: cForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top:20),
                child: Image.asset(
                  "assets/imgs/wallpaper.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Componentes.caixaDeTexto("Consultar o clima de uma cidade", "Informe a cidade", controladorCidade, validaCidade, numero: true),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                height: 100,
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.cloudSun, color: Colors.indigo, size: 50),
                  onPressed: clicouNoBotao,
                ),
              ),

              // componentes com as strings
              Componentes.rotulo(temperatura),
              Componentes.rotulo(data),
              Componentes.rotulo(tempo),
              Componentes.rotulo(descricao),
              Componentes.rotulo(atualmente),
              Componentes.rotulo(cidade),
              Componentes.rotulo(umidade),
              Componentes.rotulo(velocVento),
              Componentes.rotulo(nascDoSol),
              Componentes.rotulo(porDoSol),
              Componentes.rotulo(cidadeNome),

            ],
          ),
        ),
      ),
    );
  }

}
