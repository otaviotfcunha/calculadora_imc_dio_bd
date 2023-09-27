import 'package:calculadora_imc/model/calculadora_imc.dart';
import 'package:calculadora_imc/repository/sqflite/sqflite_database.dart';

class HistoricoCalculadoraRepository{

  Future<List<CalculadoraImc>> listarDados() async {
    List<CalculadoraImc> historico = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery('SELECT * FROM historico');
    for (var element in result) {
      historico.add(CalculadoraImc(
          int.parse(element["id"].toString()),
          element["nome"].toString(), 
          double.parse(element["peso"].toString()), 
          double.parse(element["altura"].toString()), 
          element["frase"].toString(), 
          double.parse(element["imc"].toString()) 
        ));
    }
    return historico;
  }

  Future<void> salvar(CalculadoraImc historico) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('INSERT INTO historico (nome, frase, peso, altura, imc) values(?,?,?,?,?)',
        [historico.nome, historico.fraseImc, historico.peso, historico.altura, historico.resultadoImc]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('DELETE FROM historico WHERE id = ?', [id]);
  }
}