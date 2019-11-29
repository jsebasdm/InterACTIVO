// Librerias
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:line_icons/line_icons.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

class BarraBusqueda extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: BarraTexto(),
    );
  }
}

class BarraTexto extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        suffixIcon: CirculoIcono(),
        labelText: "Búsqueda",
        labelStyle: TextStyle(color: colorAzulOpaco),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.circular(60)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorAzulOpaco, width: 2), borderRadius: BorderRadius.circular(60), gapPadding: 3.0),
      ),
    );
  }
}

class CirculoIcono extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorAzulOpaco,
      child: IconButton(icon: Icon(LineIcons.search, color: Colors.white), onPressed: () {}),
    );
  }
}