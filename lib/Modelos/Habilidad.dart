// Archivos Externos
import 'package:interactivo/Modelos/Area.dart';

// Clase Habilidad
class Habilidad {
  // Constantes
  static const String rutaBase = 'assets/imagenes/logosHabilidades/';

  // Propiedades
  final String nombre;
  final String rutaLogo;
  final Area area;
  final List<String> versiones;

  // Constructor
  Habilidad({this.nombre, this.area, this.versiones, nombreLogo}) : rutaLogo = rutaBase + nombreLogo + '.png';

  // Método Conversión a Texto
  String toString() => 'Habilidad: $nombre. Área: ${area.nombre}';

  // Método Lista Habilidades Prueba
  static Map<String, Habilidad> obtenerMapaPrueba() {
    // Inicializar Mapa Habilidades
    final mapa = Map<String, Habilidad>();
    List<String> listaVersiones;

    // Habilidades Desarrollo

    // C#
    listaVersiones = ['v1.0', 'v1.2', 'v2.0', 'v3.0', 'v4.0', 'v5.0', 'v6.0'];
    mapa['C#'] = Habilidad(nombre: 'C#', nombreLogo: 'LogoCSharp', area: Area.desarrollo, versiones: listaVersiones);

    // CSS
    listaVersiones = ['v1', 'v2', 'v2.1', 'v3'];
    mapa['CSS'] = Habilidad(nombre: 'CSS', nombreLogo: 'LogoCSS', area: Area.desarrollo, versiones: listaVersiones);

    // Dart
    listaVersiones = ['v1.0', 'v1.1', 'v1.2', 'v1.3', 'v1.4', 'v2.0', 'v2.1', 'v2.2'];
    mapa['Dart'] = Habilidad(nombre: 'Dart', nombreLogo: 'LogoDart', area: Area.desarrollo, versiones: listaVersiones);

    // Flutter
    listaVersiones = ['v1.0', 'v1.1', 'v1.2', 'v1.3', 'v1.4', 'v1.5', 'v1.6', 'v1.7', 'v1.8', 'v1.9'];
    mapa['Flutter'] = Habilidad(nombre: 'Flutter', nombreLogo: 'LogoFlutter', area: Area.desarrollo, versiones: listaVersiones);

    // HTML
    listaVersiones = ['v1', 'v2.0', 'v3.2', 'v4.0', 'v4.0.1', 'v5.0', 'v5.1', 'v5.2'];
    mapa['HTML'] = Habilidad(nombre: 'HTML', nombreLogo: 'LogoHTML', area: Area.desarrollo, versiones: listaVersiones);

    // Java
    listaVersiones = ['v1.0', 'v1.1', 'v1.2', 'v1.3', 'v1.4', 'v1.5', 'v1.6', 'v1.7', 'v1.8'];
    mapa['Java'] = Habilidad(nombre: 'Java', nombreLogo: 'LogoJava', area: Area.desarrollo, versiones: listaVersiones);

    // JavaScript
    listaVersiones = ['v1.0', 'v1.1', 'v1.2', 'v2.0', 'v2.0', 'v3.0', 'v4.0', 'v5.0', 'v6.0'];
    mapa['JavaScript'] = Habilidad(nombre: 'JavaScript', nombreLogo: 'LogoJavaScript', area: Area.desarrollo, versiones: listaVersiones);

    // PHP
    listaVersiones = ['v1.0', 'v2.0', 'v3.0', 'v4.0', 'v5.0', 'v6.0', 'v7.0'];
    mapa['PHP'] = Habilidad(nombre: 'PHP', nombreLogo: 'LogoPHP', area: Area.desarrollo, versiones: listaVersiones);

    // .NET Core
    listaVersiones = ['v1.0', 'v1.1', 'v2.0', 'v2.1', 'v2.2', 'v3.0', 'v3.1', 'v5'];
    mapa['.NET Core'] = Habilidad(nombre: '.NET Core', nombreLogo: 'LogoPuntoNET', area: Area.desarrollo, versiones: listaVersiones);

    // Python
    listaVersiones = ['v0.9.0', 'v1.0', 'v1.2', 'v1.4', 'v2.0', 'v2.1', 'v2.2', 'v2.6', 'v3.0'];
    mapa['Python'] = Habilidad(nombre: 'Python', nombreLogo: 'LogoPython', area: Area.desarrollo, versiones: listaVersiones);

    // Habilidades Infraestructura

    // Amazon Web Services (AWS)
    listaVersiones = ['v1.0.0', 'v1.1.0', 'v1.2.0', 'v1.3.0'];
    mapa['AWS'] = Habilidad(nombre: 'AWS', nombreLogo: 'LogoAWS', area: Area.infraestructura, versiones: listaVersiones);

    // Azure Dev Ops
    listaVersiones = ['2005', '2010', '2015', '2018', '2019'];
    mapa['AzureDevOps'] = Habilidad(nombre: 'Azure DevOps', nombreLogo: 'LogoAzureDevOps', area: Area.infraestructura, versiones: listaVersiones);

    // Bash
    listaVersiones = ['v1.0', 'v2.0', 'v3.0', 'v4.0', 'v5.0',];
    mapa['Bash'] = Habilidad(nombre: 'Bash', nombreLogo: 'LogoBash', area: Area.infraestructura, versiones: listaVersiones);

    // Cisco
    listaVersiones = ['v1.0', 'v2.0', 'v3.0', 'v4.0', 'v5.0', 'v6.0', 'v7.0', 'v8.0', 'v9.0', 'v10.0'];
    mapa['Cisco'] = Habilidad(nombre: 'Cisco', nombreLogo: 'LogoCisco', area: Area.infraestructura, versiones: listaVersiones);

    // Docker
    listaVersiones = ['v0.1', 'v0.2', 'v0.3', 'v0.4', 'v0.5', 'v0.5.12', 'v0.5.13', 'v0.5.14'];
    mapa['Docker'] = Habilidad(nombre: 'Docker', nombreLogo: 'LogoDocker', area: Area.infraestructura, versiones: listaVersiones);

    // Jenkins
    listaVersiones = ['v1.0', 'v1.1', 'v1.3', 'v1.4', 'v2.0', 'v2.1', 'v2.46'];
    mapa['Jenkins'] = Habilidad(nombre: 'Jenkins', nombreLogo: 'LogoJenkins', area: Area.infraestructura, versiones: listaVersiones);

    // Linux
    listaVersiones = ['Madribian', 'Ubuntu', 'Debian', 'Slackware'];
    mapa['Linux'] = Habilidad(nombre: 'Linux', nombreLogo: 'LogoLinux', area: Area.infraestructura, versiones: listaVersiones);

    // Retornar Mapa Completo
    return mapa;
  }

}