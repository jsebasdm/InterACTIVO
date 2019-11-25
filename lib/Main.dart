// Librerías
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';

// Función Principal
void main() => runApp(Aplicacion());

// Clase Aplicación
class Aplicacion extends StatelessWidget {
  // Método Contenido Gráfico
  Widget build(BuildContext context) {
    // Color Barra de Estado
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: colorGrisAzulado));

    // Aplicación
    return MaterialApp(
      theme: ThemeData(primaryColor: colorAzulOpaco, cursorColor: colorAzulOpaco),
      debugShowCheckedModeBanner: false,
      title: 'Pruebas Reto',
      initialRoute: 'Splash',
      routes: mapaRutas,
    );
  }
}
