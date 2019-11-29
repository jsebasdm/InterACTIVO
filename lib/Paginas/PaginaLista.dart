// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Paginas/PlantillaPagina.dart';

// Clase Página
class PaginaLista extends StatelessWidget {
  Widget build(BuildContext contexto) {
    final listaContenido = [Text('Página Lista (mentiras, no está lista)')];
    return PlantillaPagina(listaContenido: listaContenido, paddingContenido: 10);
  }
}