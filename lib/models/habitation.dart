import 'package:tdlocation/models/typehabitat.dart';

class Habitation {
  int id;
  TypeHabitat typeHabitat;
  String image;
  String libelle;
  String adresse;
  int chambres;
  int superficie;
  double prixmois;

  Habitation(
      {required this.id,
      required this.typeHabitat,
      required this.image,
      required this.libelle,
      required this.adresse,
      required this.chambres,
      required this.superficie,
      required this.prixmois});
}
