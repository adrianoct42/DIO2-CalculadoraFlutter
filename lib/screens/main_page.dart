import 'package:flutter/material.dart';
import 'package:imcflutter/classes/imc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  var listaImc = <Imc>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Bem Vindo(a) a Calculadora de IMC Flutter!",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Peso em KG:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Altura em M:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                  child: const Text(
                    "Calcular IMC",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (pesoController.text != "" &&
                        alturaController.text != "" &&
                        double.parse(alturaController.text) > 0 &&
                        double.parse(pesoController.text) > 0) {
                      listaImc.add(Imc(double.parse(pesoController.text),
                          double.parse(alturaController.text)));
                      setState(() {});
                    }
                    pesoController.text = alturaController.text = "";
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listaImc.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    "Peso: ${listaImc[index].peso.toStringAsFixed(2)}"),
                                Text(
                                    "Altura: ${listaImc[index].altura.toStringAsFixed(2)}"),
                                const SizedBox(height: 10),
                                Text(
                                  "IMC: ${listaImc[index].imcString()}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
