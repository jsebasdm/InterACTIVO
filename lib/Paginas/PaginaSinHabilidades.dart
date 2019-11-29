// Librerías
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Archivos Externos
import 'package:interactivo/Paginas/PlantillaPagina.dart';
import 'package:interactivo/Utilidades/Constantes.dart';

// Clase Página
class PaginaSinHabilidades extends StatelessWidget {
  Widget build(BuildContext contexto) {
    // Método Navegación Agregar Habilidad
    void funcionBoton() => Navigator.popAndPushNamed(contexto, 'Formulario');

    // Animación Niño Héroe
    final rutaAnimacion = 'assets/animaciones/Heroe.flr';
    final animacion = FlareActor(rutaAnimacion, animation: 'Heroe', alignment: Alignment.center, fit: BoxFit.contain);
    final cajaAnimacion = Container(child: animacion, width: 220, height: 220);

    // Frase Motivación
    final fraseMotivacion = Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('¡Eres mas hábil de lo que crees!', textAlign: TextAlign.center, style: estiloFraseMotivacional),
    );

    // Botón Agregar Habilidad
    final forma = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
    final iconoBoton = Icon(Icons.add, color: Colors.white, size: 40);
    final textoBoton = Text('Agrega una Habilidad', style: estiloBotonNuevaHabilidad, textAlign: TextAlign.center);
    final filaBoton = Row(mainAxisSize: MainAxisSize.min, children: [iconoBoton, SizedBox(width: 20), textoBoton]);
    final padding = EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 30);
    final botonAgregar = RaisedButton(
        child: filaBoton, padding: padding, color: colorAzulOpaco, textColor: Colors.white, onPressed: funcionBoton, shape: forma);

    // Lista Elementos Páginas
    final listaContenido = [cajaAnimacion, SizedBox(height: 20), fraseMotivacion, SizedBox(height: 50), botonAgregar];

    // Página según Plantilla
    return PlantillaPagina(
        listaContenido: listaContenido, nombreLogo: 'LogoInterActivo', hayMenuNavegacion: false, paddingContenido: 15);
  }
}
