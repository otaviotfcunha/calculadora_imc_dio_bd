import 'package:calculadora_imc/services/app_storage_service.dart';
import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  String? limpaDados;
  double? valor;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text =
        (await (storage.getConfiguracoesAltura())).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Configurações do App")),
            body: Container(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(hintText: "Digite o seu nome"),
                      controller: nomeUsuarioController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Digite a sua altura"),
                      controller: alturaController,
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        //fecha o teclado para não dar problema na tela
                        FocusManager.instance.primaryFocus?.unfocus();

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

                          if (valor! > 0) {
                            await storage.setConfiguracoesAltura(
                              double.parse(valor.toString()));
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
                        await storage.setConfiguracoesNomeUsuario(
                            nomeUsuarioController.text);
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"))
                ],
              ),
            )));
  }
}