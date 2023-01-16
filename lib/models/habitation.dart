import 'package:tdlocation/models/typehabitat.dart';

class Habitation {
  int id;
  TypeHabitat typeHabitat;
  String image;
  String libelle;
  String adresse;
  int chambres;
  int superficie;
  int nbpersonnes;
  double prixmois;
  int lits;
  int salleBains;
  List<Option> options;
  List<OptionPayante> optionsPayantes;

  Habitation(
      this.id,
      this.typeHabitat,
      this.image,
      this.libelle,
      this.adresse,
      this.chambres,
      this.superficie,
      this.nbpersonnes,
      this.prixmois,
      this.lits,
      this.salleBains,
      {this.options = const [],
      this.optionsPayantes = const []});

  Habitation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        typeHabitat = TypeHabitat.fromJson(json['typehabitat']),
        image = json['image'],
        libelle = json['libelle'],
        adresse = json['adresse'],
        chambres = json['chambres'],
        superficie = json['superficie'],
        nbpersonnes = json['habitantsmax'],
        prixmois = json['prixmois'],
        lits = json['lits'],
        salleBains = json['sdb'],
        options = json['items'] != null
            ? (json['items'] as List)
                .map<Option>((item) => Option.fromJson(item))
                .toList()
            : [Option(0, 'Aucune option disponible')],
        optionsPayantes = json['optionspayantes'] != null
            ? (json['optionspayantes'] as List)
                .map<OptionPayante>((item) => OptionPayante.fromJson(item))
                .toList()
            : [OptionPayante(0, 'Aucune option payante disponible')];
}

class Option {
  int id;
  String libelle;
  String description;

  Option(this.id, this.libelle, {this.description = ""});

  Option.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        libelle = json['libelle'] ?? '',
        description = json['description'] ?? '';
}

class OptionPayante extends Option {
  double prix;

  OptionPayante(super.id, super.libelle,
      {super.description = "", this.prix = 0});

  OptionPayante.fromJson(Map<String, dynamic> json)
      : prix = json['prix'] ?? '',
        super(json['id'], json['libelle'], description: json['description']);
}
