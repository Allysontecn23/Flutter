import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transferências")),
      body: Column(
        children: [
          ItemTransferencia(transferencia: Transferencia(100.0, 859528)),
          ItemTransferencia(transferencia: Transferencia(300.0, 1000)),
          ItemTransferencia(transferencia: Transferencia(500.0, 1050)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({super.key, required this.transferencia});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('R\$ ${transferencia.valor.toString()}'),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);


  @override
  String toString() {
    return 'Transparecia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferência"),
      ),
      body:  Column(
        children: [
            Padding(
            padding: const EdgeInsets.all(16.0),
             child:  TextField( 
              controller: _controladorCampoNumeroConta,
              decoration: const InputDecoration(
                labelText: "Número da conta",
                labelStyle: TextStyle(
                  fontSize: 24.0
                ),
                hintText: "0000",
              ),
              keyboardType: TextInputType.number,
             ),
           ),
            Padding(
            padding: const EdgeInsets.all(16.0),
             child:  TextField( 
              controller: _controladorCampoValor,
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Valor",
                labelStyle: TextStyle(
                  fontSize: 24.0
                ),
                hintText: "0.00",
              ),
              keyboardType: TextInputType.number,
             ),
           ),
           ElevatedButton(
            onPressed: () {
              final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor = double.tryParse(_controladorCampoValor.text);
              if(numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            }, 
            child: const Text("Confimar"))
        ],
      ),
    );
  }
}
