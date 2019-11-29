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

  // Constructor
  Habilidad({this.nombre, this.area, nombreLogo}) : rutaLogo = rutaBase + nombreLogo + '.png';

  // Método Lista Habilidades Prueba
  static Map<String, Habilidad> obtenerMapaPrueba() {
    // Inicializar Mapa Habilidades
    final mapa = Map<String, Habilidad>();

    // Habilidades Desarrollo
    mapa['C#'] = Habilidad(nombre: 'C#', nombreLogo: 'LogoCSharp', area: Area.desarollo);
    mapa['CSS'] = Habilidad(nombre: 'CSS', nombreLogo: 'LogoCSS', area: Area.desarollo);
    mapa['Dart'] = Habilidad(nombre: 'Dart', nombreLogo: 'LogoDart', area: Area.desarollo);
    mapa['Flutter'] = Habilidad(nombre: 'Flutter', nombreLogo: 'LogoFlutter', area: Area.desarollo);
    mapa['HTML'] = Habilidad(nombre: 'HTML', nombreLogo: 'LogoHTML', area: Area.desarollo);
    mapa['HTML'] = Habilidad(nombre: 'HTML', nombreLogo: 'LogoHTML', area: Area.desarollo);
    mapa['Java'] = Habilidad(nombre: 'Java', nombreLogo: 'LogoJava', area: Area.desarollo);
    mapa['JavaScript'] = Habilidad(nombre: 'JavaScript', nombreLogo: 'LogoJavaScript', area: Area.desarollo);
    mapa['PHP'] = Habilidad(nombre: 'PHP', nombreLogo: 'LogoPHP', area: Area.desarollo);
    mapa['.NET Core'] = Habilidad(nombre: '.NET Core', nombreLogo: 'LogoPuntoNET', area: Area.desarollo);
    mapa['Python'] = Habilidad(nombre: 'Python', nombreLogo: 'LogoPython', area: Area.desarollo);

    // Habilidades Infraestructura
    mapa['AWS'] = Habilidad(nombre: 'AWS', nombreLogo: 'LogoAWS', area: Area.infraestructura);
    mapa['AzureDevOps'] = Habilidad(nombre: 'AzureDevOps', nombreLogo: 'LogoAzureDevOps', area: Area.infraestructura);
    mapa['Bash'] = Habilidad(nombre: 'Bash', nombreLogo: 'LogoBash', area: Area.infraestructura);
    mapa['Cisco'] = Habilidad(nombre: 'Cisco', nombreLogo: 'LogoCisco', area: Area.infraestructura);
    mapa['Docker'] = Habilidad(nombre: 'Docker', nombreLogo: 'LogoDocker', area: Area.infraestructura);
    mapa['Jenkins'] = Habilidad(nombre: 'Jenkins', nombreLogo: 'LogoJenkins', area: Area.infraestructura);
    mapa['Linux'] = Habilidad(nombre: 'Linux', nombreLogo: 'LogoLinux', area: Area.infraestructura);

    // Retornar Mapa Completo
    return mapa;
  }

}