// Librerías
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// Archivos Externos
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:interactivo/Componentes/AccionesDialogo.dart';
import 'package:interactivo/Componentes/BotonIcono.dart';

// Clase
class BarraSuperior extends StatelessWidget {
  Widget build(BuildContext contexto) {
    // Método Navegación: Cerrar Sesión
    void cerrarSesion() => Navigator.of(contexto).pushNamedAndRemoveUntil('Despedida', (Route ruta) => false);

    // Método Abrir Diálogo Confirmación
    void abrirConfirmacion() {
      final dialogo = DialogoSalir(funcionCerrar: cerrarSesion);
      showDialog(context: contexto, barrierDismissible: true, builder: (BuildContext contexto) => dialogo);
    }

    // Contenido Gráfico
    return Container(
      color: colorAzulOpaco,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 16, right: 8),
        leading: CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/imagenes/otros/Avatar.png')),
        title: Text('César Luis Alzate Suárez', style: estiloTituloBarra),
        subtitle: Text('Ingeniero Mecatrónico', style: estiloSubtituloBarra),
        trailing: BotonIcono(icono: LineIcons.sign_out, clickBoton: abrirConfirmacion, nombrePista: 'Salir'),
      ),
    );
  }
}

class DialogoSalir extends StatelessWidget {
  // Atributos
  final Function funcionCerrar;

  // Constructor
  DialogoSalir({this.funcionCerrar});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Título
    final titulo = Text('¿Estás seguro que quieres salir?', textAlign: TextAlign.center);
    // Acciones (Fila Botones)
    final acciones = AccionesDialogo(colorBoton: colorAzulOpaco, nombreBoton: 'Salir', funcionBoton: funcionCerrar);
    // Construcción Final Diálogo
    final forma = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    return AlertDialog(shape: forma, title: titulo, actions: [acciones]);
  }
}

