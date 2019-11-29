// Librerías
import 'package:flutter/material.dart';
import 'package:interactivo/Componentes/CartaLista.dart';

// Archivos Externos
import 'package:interactivo/Paginas/PlantillaPagina.dart';

// Clase Página
class PaginaLista extends StatelessWidget {
  Widget build(BuildContext contexto) {
    final listaContenido = [CartaLista()];
    return PlantillaPagina(listaContenido: listaContenido, paddingContenido: 10);
  }
}