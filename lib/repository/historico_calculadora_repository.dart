import 'package:calculadora_imc/model/calculadora_imc.dart';

class HistoricoCalculadoraRepository{

  static List<CalculadoraImc> calculadoraHistorico = [];

  static Future<void> adicionarHistoricoCalculadora(CalculadoraImc calc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    calculadoraHistorico.add(calc);
    print(calculadoraHistorico.length);
  }

  static Future<void> removerHistoricoCalculadora(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    calculadoraHistorico.remove(calculadoraHistorico.where((calc) => calc.id == id).first);
  }

  static Future<List<CalculadoraImc>> listaItensHistoricoCalculadora() async{
    await Future.delayed(const Duration(milliseconds: 100));
    return calculadoraHistorico;
  }
}