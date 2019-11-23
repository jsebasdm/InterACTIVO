// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Componentes/LogoInterGrupo.dart';
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:line_icons/line_icons.dart';

// Clase
class BarraSuperior extends StatelessWidget {
  // Método Contenido Gráfico
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: colorAzulOpaco,
          child: ListTile(
            leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/imagenes/Avatar.png')),
            title: Text('César Luis Alzate Suárez',
                style: estiloNombreColaborador),
            subtitle:
                Text('Ingeniero Mecatrónico', style: estiloCargoColaborador),
            //trailing: LogoInterGrupo(textoAbajo: 'ACTIVO', colorFondo: colorAzulClaro),
            trailing: IconButton(
                icon: Icon(LineIcons.sign_out, color: Colors.white),
                onPressed: () {}),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            LogoInterGrupo(textoAbajo: 'ACTIVO', colorFondo: colorAzulClaro),
          ],
        )
      ],
    );
  }
}
