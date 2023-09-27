import 'package:calculadora_imc/model/calculadora_imc.dart';
import 'package:calculadora_imc/repository/historico_calculadora_repository.dart';
import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    var _historico = <CalculadoraImc>[];
    _historico = HistoricoCalculadoraRepository.calculadoraHistorico;

    void obterHistorico() async {
      _historico = await HistoricoCalculadoraRepository.listaItensHistoricoCalculadora();
      setState(() {});
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      obterHistorico();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico de Cálculos"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: ListView.builder(
            itemCount: _historico.length,
            itemBuilder: (BuildContext bc, int index) {
              var hist = _historico[index];
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    title: Text(
                        "Cálculo de IMC:\nAltura: ${hist.altura} - Peso: ${hist.peso}"),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(hist.fraseImc),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Text(
                              hist.resultadoImc.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: TextButton(
                        onPressed: () async {
                          await HistoricoCalculadoraRepository.removerHistoricoCalculadora(hist.id);
                          obterHistorico();
                        }, child: const Icon(Icons.delete)),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
