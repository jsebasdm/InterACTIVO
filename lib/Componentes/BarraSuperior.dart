// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Componentes/LogoInterGrupo.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase
class BarraSuperior extends StatelessWidget {

  // Método Contenido Gráfico
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        leading: CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/imagenes/ImagenAvatar.png')),
        title: Text('<<Nombre>>', style: estiloNombreColaborador),
        subtitle: Text('<<Cargo>>', style: estiloCargoColaborador),
        trailing: LogoInterGrupo(textoAbajo: 'ACTIVO'),
      ),
    );
  }

}