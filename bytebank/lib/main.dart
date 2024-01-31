import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: const ListaTransferencias(),
      appBar: AppBar(title: const Text("Transferências")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    ),
  ));
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(transferencia: Transferencia(100.0, 859528)),
        ItemTransferencia(transferencia: Transferencia(300.0, 1000)),
        ItemTransferencia(transferencia: Transferencia(500.0, 1050)),
      ],
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
} 
