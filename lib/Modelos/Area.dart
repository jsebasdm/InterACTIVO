// Clase Área Habilidad (Desarrollo o Infraestructura)
class Area {
  // Constantes
  static const String rutaBase = 'assets/imagenes/iconosAreas/';

  // Propiedades
  final String nombre;
  final String rutaIconoBlanco;
  final String rutaIconoNegro;

  // Constructores
  const Area._areaDesarrollo()
      : nombre = 'Desarrollo',
        rutaIconoNegro = rutaBase + 'IconoDesarrolloNegro.png',
        rutaIconoBlanco = rutaBase + 'IconoDesarrolloBlanco.png';
  const Area._areaInfraestructura()
      : nombre = 'Infraestructura',
        rutaIconoNegro = rutaBase + 'IconoInfraestructuraNegro.png',
        rutaIconoBlanco = rutaBase + 'IconoInfraestructuraBlanco.png';

  // Objetos Constantes
  static get desarrollo => Area._areaDesarrollo();
  static get infraestructura => Area._areaInfraestructura();
}