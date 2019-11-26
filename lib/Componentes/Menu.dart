import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: colorAzulOpaco,
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(icon: Image(image: AssetImage('assets/imagenes/IconoCarrusel.png'), height: 22, width: 22,), onPressed: () {}),
          IconButton(icon: Icon(LineIcons.list, color: Colors.white), onPressed: () {}),
        ],
      ),
    );
  }
}