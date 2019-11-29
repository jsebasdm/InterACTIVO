// Archivos Externos
import 'package:interactivo/Modelos/Habilidad.dart';
import 'package:interactivo/Modelos/Nivel.dart';

// Clase: Registro Habilidad
class Registro {
  // Propiedades
  final Habilidad habilidad;
  final DateTime fecha;
  final Nivel nivel;
  final String version;

  // Constructor
  Registro({this.habilidad, this.nivel, this.version = 'General', fecha}) : this.fecha = fecha ?? DateTime.now();

  // Método Auxiliar
  String toString() => 'habilidad en: ${habilidad.nombre} (Nivel: ${nivel.nombre})';

  // Método Lista Registros Prueba
  static List<Registro> obtenerListaPrueba() {
    // Inicializaciones
    final lista = List<Registro>();
    final skills = Habilidad.obtenerMapaPrueba();
    DateTime fecha;

    // Registros de Prueba Desarrollo
    fecha = DateTime.utc(2018, DateTime.january, 10);
    lista.add(Registro(habilidad: skills['HTML'], nivel: Nivel.alto, version: 'v5.0', fecha: fecha));

    fecha = DateTime.utc(2018, DateTime.june, 21);
    lista.add(Registro(habilidad: skills['CSS'], nivel: Nivel.bajo, version: 'v3', fecha: fecha));

    fecha = DateTime.utc(2018, DateTime.october, 7);
    lista.add(Registro(habilidad: skills['JavaScript'], nivel: Nivel.medio, version: 'v6.0', fecha: fecha));

    fecha = DateTime.utc(2019, DateTime.may, 25);
    lista.add(Registro(habilidad: skills['PHP'], nivel: Nivel.alto, version: 'v6.0', fecha: fecha));

    lista.add(Registro(habilidad: skills['Flutter'], nivel: Nivel.bajo, version: 'v1.9'));

    // Registros de Prueba Infraestructura
    fecha = DateTime.utc(2017, DateTime.july, 9);
    lista.add(Registro(habilidad: skills['Linux'], nivel: Nivel.bajo, version: 'Ubuntu', fecha: fecha));

    fecha = DateTime.utc(2019, DateTime.april, 22);
    lista.add(Registro(habilidad: skills['Cisco'], nivel: Nivel.medio, version: 'v7.0', fecha: fecha));

    // Retornar Lista Registros
    return lista;
  }

}