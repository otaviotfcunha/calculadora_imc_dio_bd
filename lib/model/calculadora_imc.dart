class CalculadoraImc{
  int _id = 0;
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  double _resultadoImc = 0.0;
  String _fraseImc = "";

  CalculadoraImc(this._id, this._nome, this._peso, this._altura, this._fraseImc, this._resultadoImc);

  set id(int id){
    _id = id;
  }
  int get id => _id;
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
  set nome(String nome){
    _nome = nome;
  }
  String get nome => _nome;

  static double calculaImc(double pes, double altura){
    double imcFinal = pes / (altura * altura);
    return imcFinal;
  }

  static String criaFraseImc(double imc){
    String textoImc = "";
    switch (imc) {
      case < 16:
        textoImc = "Magreza grave";
        break;
      case >= 16 && < 17:
        textoImc = "Magreza moderada";
        break;
      case >= 17 && < 18.5:
        textoImc = "Magreza leve";
        break;
      case >= 18.5 && < 25:
        textoImc = "Saudável";
        break;
      case >= 25 && < 30:
        textoImc = "Sobrepeso";
        break;
      case >= 30 && < 35:
        textoImc = "Obesidade Grau I";
        break;
      case >= 35 && < 40:
        textoImc = "Obesidade Grau II (severa)";
        break;
      case >= 40:
        textoImc = "Obesidade Grau III (mórbida)";
        break;
      default:
        textoImc = "Problema para calcular o IMC.";
        break;
    }
    return textoImc;
  }

}