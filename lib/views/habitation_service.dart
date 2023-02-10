import 'package:tdlocation/models/typehabitat.dart';

import '../models/habitation.dart';
import '../models/habitations_data.dart';
import '../models/typehabitat_data.dart';

class HabitationService {
  var _typehabitats;
  var _habitations;

  HabitationService() {
    _typehabitats = TypeHabitatData.buildList();
    _habitations = HabitationsData.buildList();
  }

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
