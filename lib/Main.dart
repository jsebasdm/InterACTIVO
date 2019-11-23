// Librerías
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Archivos Externos
import 'Utilidades/Constantes.dart';

// Función Principal
void main() => runApp(Aplicacion());

// Clase Aplicación
class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Color de Barra de Estado
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: colorAzulOpaco));

    // Aplicación
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InterActivo',
      initialRoute: 'Splash',
      routes: mapaRutas,
    );
  }
}