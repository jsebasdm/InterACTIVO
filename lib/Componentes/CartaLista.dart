import 'package:flutter/material.dart';
import 'package:interactivo/Componentes/BarraBusqueda.dart';
import 'package:interactivo/Main.dart';
import 'package:interactivo/Modelos/Registro.dart';
import 'package:interactivo/Utilidades/Constantes.dart';
import 'package:interactivo/Paginas/PaginaGaleria.dart';

class CartaLista extends StatefulWidget {
  EstadoCartaLista createState() => EstadoCartaLista();
}

class EstadoCartaLista extends State<CartaLista> {
  /*
  // Navegar a Galería con índice específico
  navegarGaleria(BuildContext contexto, int indice) {
    return MaterialPageRoute(builder: (contexto) => PaginaGaleria(), settings: RouteSettings(arguments: indice));
  }
   */

  // Método Contenido Gráfico
  Widget construccionCartaLista(Registro registro, int indice) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Container(height: 15, color: colorAzulOpaco),
            ListTile(
              contentPadding: EdgeInsets.only(right: 20, left: 10, top: 2, bottom: 2),
              title: Text(
                '${registro.habilidad.nombre}',
                style: estiloTituloLista,
              ),
              subtitle: Text(registro.version, style: estiloSubtituloLista),
              leading: Image(image: AssetImage(registro.habilidad.rutaLogo), fit: BoxFit.contain),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(registro.nivel.nombre, style: estiloSubtituloLista),
                  SizedBox(width: 8),
                  Image(image: AssetImage(registro.nivel.rutaImagen), width: 15),
                ],
              ),
              // onTap: () => Navigator.pushNamed(context, 'Galeria'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(listaRegistros.length, (int indice) {
          return construccionCartaLista(listaRegistros[indice], indice);
        }).toList()
      ),
    );
  }
}
