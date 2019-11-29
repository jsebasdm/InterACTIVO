// Librerías
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:interactivo/Modelos/Registro.dart';

// Variables Globales
List<Registro> listaRegistros = Registro.obtenerListaPrueba();

// Función Principal
void main() => runApp(Aplicacion());

// Clase Principal
class Aplicacion extends StatelessWidget {
  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Barra Estado
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: colorGrisAzulado));

    // Aplicación
    return MaterialApp(
      theme: ThemeData(primaryColor: colorAzulOpaco, cursorColor: colorAzulOpaco, fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      title: 'InterActivo',
      initialRoute: 'Splash',
      routes: mapaRutas,
    );
  }
}
