import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';


const _tituloAppBar = "Criando Transferência";
const _rotuloConta = "Numero da conta";
const _dicaConta = "0000";

const _rotuloValor = "Valor";
const _dicaValor = "0.00";

const _textoBotaoConfimar = "Confimar";

class FormularioTransferencia extends StatefulWidget {
  FormularioTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint('Criando transferencia');
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: _dicaConta,
              rotulo: _rotuloConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaValor,
              rotulo: _rotuloValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
                onPressed: () {
                  _criaTransferencia(context);
                },
                child: const Text(_textoBotaoConfimar))
          ],
        ),
      ),
    );
  }
}