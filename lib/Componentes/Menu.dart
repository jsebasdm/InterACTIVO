import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: colorAzulOpaco,
      notchMargin: 4.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(icon: Icon(LineIcons.angellist, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(LineIcons.list, color: Colors.white), onPressed: () {}),
        ],
      ),
    );
  }
}
