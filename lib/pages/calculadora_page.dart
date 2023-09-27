import 'package:calculadora_imc/model/calculadora_imc.dart';
import 'package:calculadora_imc/repository/historico_calculadora_repository.dart';
import 'package:calculadora_imc/services/app_storage_service.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
  
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  AppStorageService storage = AppStorageService();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String nomeDoUsuario = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeDoUsuario = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await (storage.getConfiguracoesAltura())).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          Center(
            child: Text("Olá, $nomeDoUsuario"),
          ),
          TextField(
            controller: pesoController,
            decoration: const InputDecoration(hintText: "Digite o seu peso em Kgs. Ex: 110"),
          ),
          TextField(
            controller: alturaController,
            decoration: const InputDecoration(hintText: "Digite a sua altura em metros. Ex: 180.5"),
            enabled: false,
          ),
          TextButton(
            onPressed: () async {
              CalculadoraImc calcImc = CalculadoraImc();
              double valor = 0.0;
              String limpaDados = "";

              if (alturaController.text != "") {
                try {
                  limpaDados = alturaController.text.replaceAll(",", ".");
                  valor = double.parse(limpaDados.toString());  
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("O valor da altura deve ser um número.")));
                  alturaController.text = "0";
                  return;
                }

                if (valor > 0) {
                  calcImc.altura = valor;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("A altura deve ser maior que 0, utilize . para separar decimais")));
                  alturaController.text = "0";
                  return;
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("A altura deve ser preenchida.")));
                alturaController.text = "0";
                return;
              }
              if (pesoController.text != "") {
                try {
                  limpaDados = pesoController.text.replaceAll(",", ".");
                  valor = double.parse(limpaDados.toString());  
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("O valor do peso deve ser um número.")));
                  pesoController.text = "0";
                  return;
                }
                if (valor > 0) {
                  calcImc.peso = valor;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("O peso deve ser maior que 0, utilize . para separar decimais")));
                  pesoController.text = "0";
                  return;
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("O peso deve ser preenchido.")));
                pesoController.text = "0";
                return;
              }
              calcImc.calculaImc();

              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Text(
                              " A sua altura é: ${calcImc.altura}\n O seu peso é: ${calcImc.peso}\n O seu IMC é: ${calcImc.resultadoImc.toStringAsFixed(2)} que corresponde a: ${calcImc.fraseImc}"),
                        ),
                      ),
                    ],
                  );
                },
              );
              pesoController.text = "";
              await HistoricoCalculadoraRepository.adicionarHistoricoCalculadora(calcImc);
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: const Text("Salvar e Calcular"),
          )
        ],
      ),
    );
  }
}
