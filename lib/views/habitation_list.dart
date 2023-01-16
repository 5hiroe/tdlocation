import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdlocation/models/habitation.dart';
import 'package:tdlocation/views/habitation_feature_widget.dart';

import 'habitation_details.dart';
import 'habitation_service.dart';

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
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HabitationDetails(habitation)),
              );
            },
            child: _buildDetails(habitation)));
  }

  _buildDetails(Habitation habitation) {
    var format = NumberFormat('### €');
    return Column(
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
        HabitationFeatureWidget(habitation)
      ],
    );
  }
}
