import 'package:flutter/material.dart';
import 'package:tdlocation/views/habitation_option.dart';

import '../models/habitation.dart';

class HabitationFeatureWidget extends StatelessWidget {
  final Habitation _habitation;
  const HabitationFeatureWidget(this._habitation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      HabitationOption(
          icon: Icons.group, texte: "${_habitation.nbpersonnes} personnes"),
      HabitationOption(
          icon: Icons.bed, texte: "${_habitation.chambres} chambres"),
      HabitationOption(
          icon: Icons.fit_screen, texte: "${_habitation.superficie} m²")
    ]);
  }
}
