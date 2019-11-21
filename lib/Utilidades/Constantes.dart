// Librerías
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Paginas/PaginaDespedida.dart';
import 'package:interactivo/Paginas/PaginaFormulario.dart';
import 'package:interactivo/Paginas/PaginaGaleria.dart';
import 'package:interactivo/Paginas/PaginaIngreso.dart';
import 'package:interactivo/Paginas/PaginaSplash.dart';
import 'package:interactivo/Paginas/PaginaPruebas.dart';

// Mapa de Rutas
final Map<String, StatelessWidget Function(BuildContext contexto)> mapaRutas = {
  'Splash': (BuildContext contexto) => PaginaSplash(),
  'Ingreso': (BuildContext contexto) => PaginaIngreso(),
  'Formulario': (BuildContext contexto) => PaginaFormulario(),
  'Galeria': (BuildContext contexto) => PaginaGaleria(),
  'Despedida': (BuildContext contexto) => PaginaDespedida(),
  'Pruebas': (BuildContext contexto) => PaginaPruebas(),
};

// Colores
const Color colorAzulClaro = Color(0xFF00AFEE);
const Color colorAzulOpaco = Color(0xFF003B4B);
const Color colorGrisAzulado = Color(0xFF293742);

// Estilos Texto
const TextStyle estiloNombreColaborador = TextStyle(fontSize: 14, fontFamily: 'Roboto', color: Colors.black);
const TextStyle estiloCargoColaborador = TextStyle(fontSize: 12, fontFamily: 'Roboto', color: Colors.grey);