// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Paginas/PlantillaPagina.dart';
import 'package:interactivo/Componentes/CartaFormulario.dart';
import 'package:interactivo/Componentes/Ruleta.dart';
import 'package:interactivo/Componentes/SeleccionNivel.dart';

// Clase Página
class PaginaFormulario extends StatefulWidget {
  PaginaFormularioEstado createState() => PaginaFormularioEstado();
}

// Estado Página
class PaginaFormularioEstado extends State<PaginaFormulario> {

  // Atributos
  String nombreNivel;


  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Elementos Página Formulario:
    // Ruleta
    final cartaRuleta = CartaFormulario(
      contenido: Ruleta(),
      titulo: 'Versión',
      valorInicial: 'v2.0',
    );

    // Selector Nivel
    final cartaNivel = CartaFormulario(
      contenido: SeleccionNivel(),
      titulo: 'Nivel',
      valorInicial: 'Bajo',
    );

    final separador = SizedBox(height: 20);
    final separadorInferior = SizedBox(height: 40);

    // Unión Contenido
    final listaContenido = [separador, cartaRuleta, separador, cartaNivel, separadorInferior];

    // Plantilla
    return PlantillaPagina(listaContenido: listaContenido);
  }
}
