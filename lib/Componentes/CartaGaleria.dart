// Librerías
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// Archivos Externos
import 'package:interactivo/Componentes/BotonIcono.dart';
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:interactivo/Modelos/Registro.dart';
import 'package:interactivo/Utilidades/Funciones.dart';

// Clase Carta Galería
class CartaGaleria extends StatelessWidget {
  // Estado Carta
  final Registro registro;
  final double opacidad;
  final Function clickEliminar;

  // Constructor
  CartaGaleria({this.registro, this.clickEliminar, this.opacidad = 1});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Unión Contenido Carta
    final listaElementosCarta = [
      EncabezadoCarta(registro),
      CuerpoCarta(registro),
      InformacionCarta(registro: registro, clickEliminar: clickEliminar),
    ];
    final columnaCarta = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: listaElementosCarta,
    );

    // Contenedor Carta
    final silueta = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    final carta = Card(child: columnaCarta, shape: silueta, clipBehavior: Clip.antiAliasWithSaveLayer, elevation: 20);
    return Container(child: Opacity(child: carta, opacity: opacidad));
  }
}

// Clase Encabezado Carta (Título + Ícono Área)
class EncabezadoCarta extends StatelessWidget {
  // Atributos
  final Registro registro;

  // Constructor
  EncabezadoCarta(this.registro);

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    final titulo =
        Expanded(child: Text(registro.habilidad.nombre, style: estiloBotonIngresar, textAlign: TextAlign.center));
    final iconoArea = Image(image: AssetImage(registro.habilidad.area.rutaIconoBlanco), height: 30);
    return Container(
      decoration: BoxDecoration(color: colorAzulOpaco),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(children: [iconoArea, titulo]),
    );
  }
}

// Clase Cuerpo Carta (Avatar Imagen Skill + Ícono Medalla)
class CuerpoCarta extends StatelessWidget {
  // Atributos
  final Registro registro;

  // Constructor
  CuerpoCarta(this.registro);

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Avatar Skill
    final imagenSkill = Center(child: Image(image: AssetImage(registro.habilidad.rutaLogo), fit: BoxFit.contain));
    final contenedorLogoSkill = Container(child: imagenSkill, padding: EdgeInsets.all(20));

    // Ícono Medalla
    final imagenMedalla = Image(image: AssetImage(registro.nivel.rutaImagen), width: 32);
    final filaMedalla = Row(children: [imagenMedalla], mainAxisAlignment: MainAxisAlignment.end);
    final contenedorMedalla = Container(child: filaMedalla, padding: EdgeInsets.all(10));

    // Cuerpo Carta
    return Expanded(child: Stack(children: [contenedorLogoSkill, contenedorMedalla]));
  }
}

// Clase Fila Información
class FilaInformacion extends StatelessWidget {
  // Atributos
  final String textoEtiqueta;
  final String textoCampo;

  // Constructor
  FilaInformacion({this.textoEtiqueta, this.textoCampo});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    final etiqueta = Text(textoEtiqueta, style: estiloTituloBarra);
    final campo = Text(textoCampo, style: estiloValoresCarta);
    final fila = Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [etiqueta, campo]);
    return Container(child: fila, padding: EdgeInsets.symmetric(vertical: 2));
  }
}

// Clase Información Carta
class InformacionCarta extends StatelessWidget {
  // Atributos
  final Registro registro;
  final Function clickEliminar;
  final Function clickEditar;

  // Constructor
  InformacionCarta({this.registro, this.clickEliminar, this.clickEditar});

  // Método Contenido Gráfico
  Widget build(BuildContext contexto) {
    // Filas Información
    final fecha = FilaInformacion(textoEtiqueta: 'Fecha', textoCampo: FormatoFechas.interpretarFecha(registro.fecha));
    final area = FilaInformacion(textoEtiqueta: 'Área', textoCampo: registro.habilidad.area.nombre);
    final nivel = FilaInformacion(textoEtiqueta: 'Nivel', textoCampo: registro.nivel.nombre);
    final version = FilaInformacion(textoEtiqueta: 'Versión', textoCampo: registro.version);

    // Unión de Filas de Información
    final listaInformacion = [fecha, area, nivel, version];
    final columnaInformacion = Column(crossAxisAlignment: CrossAxisAlignment.start, children: listaInformacion);

    // Columna Íconos: Editar, Eliminar
    final iconoEditar = BotonIcono(icono: LineIcons.edit, nombrePista: 'Editar', clickBoton: () {});
    final iconoEliminar = BotonIcono(icono: LineIcons.trash, clickBoton: clickEliminar, nombrePista: 'Eliminar');
    final listaIconos = [iconoEditar, iconoEliminar];
    final columnaIconos = Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: listaIconos);

    // Contenedor Información Carta
    return Container(
      decoration: BoxDecoration(color: colorAzulOpaco),
      padding: EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 10),
      child: Row(
        children: [Expanded(child: columnaInformacion), SizedBox(width: 8), columnaIconos],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
