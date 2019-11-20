// Librerías
import 'package:flutter/material.dart';

// Función Principal
void main() => runApp(Aplicacion());

// Clase Aplicación
class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inter Activo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PaginaInicial(),
    );
  }
}

// Clase Página Inicial
class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InterActivo')),
      body: Center(
        child: Text('InterActivo'),
      ),
    );
  }
}
