// Librerías
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Menú Navegación
class MenuNavegacion extends StatelessWidget {
  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Métodos Navegación
    void navegarGaleria() => Navigator.popAndPushNamed(contexto, 'Galeria');
    void navegarLista() => Navigator.popAndPushNamed(contexto, 'Lista');

    // Íconos
    final iconoGaleria =
        Image(image: AssetImage('assets/imagenes/otros/IconoCarrusel.png'), fit: BoxFit.contain, width: 24);
    final botonIconoGaleria = IconButton(icon: iconoGaleria, onPressed: navegarGaleria, tooltip: 'Galería');
    final botonIconoLista =
        IconButton(icon: Icon(LineIcons.list, color: Colors.white), onPressed: navegarLista, tooltip: 'Lista');
    final listaIconos = [botonIconoGaleria, botonIconoLista];
    final filaIconos = Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: listaIconos);

    // Barra Navegación
    return BottomAppBar(shape: CircularNotchedRectangle(), color: colorAzulOpaco, notchMargin: 8, child: filaIconos);
  }
}
