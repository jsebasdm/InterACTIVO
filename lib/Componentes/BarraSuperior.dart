// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:line_icons/line_icons.dart';

// Clase
class BarraSuperior extends StatelessWidget {
  // Método Contenido Gráfico
  @override
  Widget build(BuildContext context) {

    final iconoLogout = RawMaterialButton(
      shape: CircleBorder(),
      constraints: BoxConstraints(),
      onPressed: () {},
      child: Container(
        child: Icon(LineIcons.sign_out, color: Colors.white), 
        padding: EdgeInsets.all(16),
        ),    
    );

    return Container(
      color: colorAzulOpaco,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 16, right: 8, bottom: 4, top: 4),
        leading: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/imagenes/Avatar.png')),
        title: Text('César Luis Alzate Suárez', style: estiloNombreColaborador),
        subtitle: Text('Ingeniero Mecatrónico', style: estiloCargoColaborador),
        trailing: iconoLogout,
      ),
    );
  }
}
