import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  const Editor({
    super.key,
    required this.controlador,
    required this.dica,
    required this.rotulo,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          labelStyle: const TextStyle(fontSize: 24.0),
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
