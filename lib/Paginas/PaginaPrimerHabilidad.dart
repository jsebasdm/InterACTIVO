// Librería
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Componentes/BarraSuperior.dart';
import 'package:interactivo/Componentes/PrimerFormulario.dart';

// Clase Página
class PaginaPrimerHabilidad extends StatelessWidget {
  // ELEMENTOS GRÁFICOS
  // Contenido Principal de Página
  Widget contenidoPagina() {
    return PrimerFormulario();
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
    );
  }
}