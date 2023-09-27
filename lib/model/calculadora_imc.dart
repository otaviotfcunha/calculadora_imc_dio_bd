import 'package:flutter/material.dart';

class CalculadoraImc{
  String _id = UniqueKey().toString();
  double _peso = 0.0;
  double _altura = 0.0;
  double _resultadoImc = 0.0;
  String _fraseImc = "";

  get id => _id;
  set peso(double pes){
    _peso = pes;
  }
  double get peso => _peso;
  set altura(double alt){
    _altura = alt;
  }
  double get altura => _altura;
  double get resultadoImc => _resultadoImc;
  String get fraseImc => _fraseImc;

  calculaImc(){
    double imcFinal = _peso / (_altura * _altura);
    switch (imcFinal) {
      case < 16:
        _fraseImc = "Magreza grave";
        break;
      case >= 16 && < 17:
        _fraseImc = "Magreza moderada";
        break;
      case >= 17 && < 18.5:
        _fraseImc = "Magreza leve";
        break;
      case >= 18.5 && < 25:
        _fraseImc = "Saudável";
        break;
      case >= 25 && < 30:
        _fraseImc = "Sobrepeso";
        break;
      case >= 30 && < 35:
        _fraseImc = "Obesidade Grau I";
        break;
      case >= 35 && < 40:
        _fraseImc = "Obesidade Grau II (severa)";
        break;
      case >= 40:
        _fraseImc = "Obesidade Grau III (mórbida)";
        break;
      default:
        _fraseImc = "Problema para calcular o IMC.";
        break;
    }
    _resultadoImc = imcFinal;
  }

}