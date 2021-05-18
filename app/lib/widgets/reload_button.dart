import 'package:flutter/material.dart';

/// ReloadButton - Classe que representa um botão
/// com a função de reload. Usado normalmente para reiniciar
/// algum processo.
///
/// @author Rodrigo Andrade
class ReloadButton extends StatelessWidget {
  final Function reloadFunction;

  ReloadButton({this.reloadFunction});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.autorenew),
      onPressed: reloadFunction,
    );
  }
}
