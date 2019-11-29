// Clase Nivel (Bajo, Medio, Alto)
class Nivel {
  // Constantes
  static const String rutaBase = 'assets/imagenes/medallas/';

  // Propiedades
  final String nombre;
  final String rutaImagen;

  // Constructores
  const Nivel._nivelBajo() : nombre = 'Bajo', rutaImagen = rutaBase + 'MedallaBronce.png';
  const Nivel._nivelMedio() : nombre = 'Medio', rutaImagen = rutaBase + 'MedallaPlata.png';
  const Nivel._nivelAlto() : nombre = 'Alto', rutaImagen = rutaBase + 'MedallaOro.png';

  // Objetos Constantes
  static get bajo => Nivel._nivelBajo();
  static get medio => Nivel._nivelMedio();
  static get alto => Nivel._nivelAlto();
}