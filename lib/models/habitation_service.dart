import 'package:tdlocation/models/typehabitat.dart';

import 'habitation.dart';

class HabitationService {
  final _typehabitats = [
    TypeHabitat(id: 1, libelle: 'Maison'),
    TypeHabitat(id: 2, libelle: 'Appartement')
  ];

  final _habitations = List.generate(30, (index) {
    bool maison = index % 3 == 0;
    return Habitation(
      id: index,
      typeHabitat: maison
          ? TypeHabitat(id: 1, libelle: 'Maison')
          : TypeHabitat(id: 2, libelle: 'Appartement'),
      image:
          maison ? 'assets/images/maison.jpg' : 'assets/images/appartement.jpg',
      libelle: maison ? 'Maison $index' : 'Appartement $index',
      adresse: 'Rue $index',
      chambres: 2 + index % 3,
      superficie: 50 + index % 3,
      prixmois: (400 + index % 3).toDouble(),
    );
  });

  List<TypeHabitat> getTypeHabitats() {
    return _typehabitats;
  }

  List<Habitation> getHabitationsTop10() {
    return _habitations
        .where((habitation) => habitation.id % 2 == 1)
        .take(10)
        .toList();
  }

  List<Habitation> getMaisons() {
    return _getHabitations(isHouseList: true);
  }

  List<Habitation> getAppartements() {
    return _getHabitations(isHouseList: false);
  }

  List<Habitation> _getHabitations({required bool isHouseList}) {
    return _habitations
        .where(
            (habitation) => habitation.typeHabitat.id == (isHouseList ? 1 : 2))
        .toList();
  }
}
