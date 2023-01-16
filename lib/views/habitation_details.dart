import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdlocation/models/habitation.dart';
import 'package:tdlocation/share/location_style.dart';
import 'package:tdlocation/share/location_text_style.dart';
import 'package:tdlocation/views/habitation_feature_widget.dart';
import 'package:tdlocation/views/habitation_option.dart';

class HabitationDetails extends StatefulWidget {
  final Habitation _habitation;
  const HabitationDetails(this._habitation, {Key? key}) : super(key: key);

  @override
  State<HabitationDetails> createState() => _HabitationDetailsState();
}

class _HabitationDetailsState extends State<HabitationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._habitation.libelle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          HabitationFeatureWidget(widget._habitation),
          _buildItems(),
          _buildOptionsPayantes(),
          _buildRentButton()
        ],
      ),
    );
  }

  _buildRentButton() {
    var format = NumberFormat('### €');

    return Container(
      decoration: BoxDecoration(
          color: LocationStyle.backgroundColorPurple,
          borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                format.format(widget._habitation.prixmois),
                // TODO : Style
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    print('Louer habitation.');
                  },
                  child: const Text('Louer')))
        ],
      ),
    );
  }

  _buildItems() {
    return Wrap(
        spacing: 2.0,
        children: Iterable.generate(
            widget._habitation.options.length,
            (i) => Container(
                  padding: const EdgeInsets.only(left: 15.0),
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget._habitation.options[i].libelle,
                          style: LocationTextStyle.boldTextStyle),
                      Text(widget._habitation.options[i].description,
                          style: LocationTextStyle.regularGreyTextStyle),
                    ],
                  ),
                )).toList());
  }

  _buildOptionsPayantes() {
    return Wrap(
        spacing: 2.0,
        children: Iterable.generate(
            widget._habitation.optionsPayantes.length,
            (i) => Container(
                  padding: const EdgeInsets.only(left: 15.0),
                  margin: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text(widget._habitation.optionsPayantes[i].libelle,
                          style: LocationTextStyle.boldTextStyle),
                      Text(
                          '${widget._habitation.optionsPayantes[i].prix.toString()} €',
                          style: LocationTextStyle.regularGreyTextStyle),
                    ],
                  ),
                )).toList());
  }
}
