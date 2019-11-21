// Librería
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Componentes/BarraSuperior.dart';
import 'package:interactivo/Componentes/Menu.dart';

// Clase Página
class PaginaFormulario extends StatelessWidget {
  // ELEMENTOS GRÁFICOS
  // Contenido Principal de Página
  Widget contenidoPagina() {
    return Center(
      child: Text('Contenido de Formulario'),
    );
  }

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[BarraSuperior(), Expanded(child: contenidoPagina())]),
      ),
      bottomNavigationBar: Menu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
