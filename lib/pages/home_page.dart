import 'package:calculadora_imc/pages/calculadora_page.dart';
import 'package:calculadora_imc/pages/configuracoes_page.dart';
import 'package:calculadora_imc/pages/historico_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de IMC"),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  CalculadoraPage(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
                  if(value == 1){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoricoPage()));
                  }else if(value == 2){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfiguracoesPage()));
                  }
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                    label: "Home", icon: Icon(Icons.home)
                  ),
                  BottomNavigationBarItem(
                    label: "Histórico", icon: Icon(Icons.history)
                  ),
                  BottomNavigationBarItem(
                    label: "Config", icon: Icon(Icons.settings)
                  ),
                ])
        ),
      );
  }
}