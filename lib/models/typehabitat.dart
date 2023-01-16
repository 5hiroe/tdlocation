class TypeHabitat {
  int id;
  String libelle;

  TypeHabitat({required this.id, required this.libelle});

  TypeHabitat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        libelle = json['libelle'];
}
