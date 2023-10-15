import 'package:app_via_cep/model/cep_back4app_model.dart';
import 'package:app_via_cep/repository/cep_back4app_repository.dart';
import 'package:app_via_cep/repository/viacep_repository.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCepModel = CepBack4AppModel();
  var viaCepRepository = ViaCepRepository();
  var salvarCep = CepBack4AppRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("CEP")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const Text(
                "Consulta de CEP",
                style: TextStyle(fontSize: 22),
              ),
              TextFormField(
                  controller: cepController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                  onChanged: (String value) async {
                    var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                    if (cep.length == 8) {
                      setState(() {
                        loading = true;
                      });

                      viaCepModel = await viaCepRepository.obterCep(cep);
                    }
                    setState(() {
                      loading = false;
                    });
                  }),
              const SizedBox(height: 50),
              Text(
                viaCepModel.logradouro ?? "",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}",
                style: TextStyle(fontSize: 22),
              ),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator()),
              TextButton(
                  onPressed: () async {
                    List<String> cepsCadastrados = [];
                    var cepTeste = await salvarCep.consultaCeps();
                    for (var element in cepTeste.cepsCadastrados) {
                      cepsCadastrados.add(element.toString());
                      if (element.cep!.contains(viaCepModel.cep!)) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Center(
                          child: Text("O CEP JÁ ESTA CADASTRADO"),
                        )));
                        return;
                      }
                    }
                    salvarCep.salvar(viaCepModel);
                    cepController.text = "";
                    setState(() {});
                  },
                  child: const Text("Salvar dados",
                      style: TextStyle(fontSize: 16)))
            ],
          ),
        ),
      ),
    );
  }
}
