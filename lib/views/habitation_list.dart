import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdlocation/models/habitation.dart';

import '../models/habitation_service.dart';
import '../models/typehabitat.dart';
import 'habitation_option.dart';

class HabitationList extends StatelessWidget {
  final bool isHouseList;
  final HabitationService habitationService = HabitationService();
  late List<Habitation> _habitations;
  HabitationList({Key? key, required this.isHouseList}) : super(key: key) {
    _habitations = isHouseList
        ? habitationService.getMaisons()
        : habitationService.getAppartements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des ${isHouseList ? 'maisons' : 'appartements'}.'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: _habitations.length,
          itemBuilder: (context, index) =>
              _buildRow(_habitations[index], context),
          itemExtent: 285,
        )));
  }

  _buildRow(Habitation habitation, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                habitation.image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          _buildDetails(habitation),
        ],
      ),
    );
  }

  _buildDetails(Habitation habitation) {
    var format = NumberFormat('### €');
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(habitation.libelle),
                  subtitle: Text(habitation.adresse),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  format.format(habitation.prixmois),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 22),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HabitationOption(
                  icon: Icons.group, texte: '${habitation.chambres} personnes'),
              HabitationOption(
                  icon: Icons.fit_screen, texte: '${habitation.superficie} m²'),
            ],
          )
        ],
      ),
    );
  }
}
