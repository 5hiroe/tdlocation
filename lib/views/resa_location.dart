import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tdlocation/models/habitation.dart';
import 'package:tdlocation/share/location_text_style.dart';
import 'package:tdlocation/views/total_widget.dart';

class ResaLocation extends StatefulWidget {
  final Habitation _habitation;
  const ResaLocation(this._habitation, {Key? key}) : super(key: key);

  @override
  State<ResaLocation> createState() => _ResaLocationState();
}

class _ResaLocationState extends State<ResaLocation> {
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  String nbPersonnes = '1';
  List<OptionPayanteCheck> optionPayanteChecks = [];

  var format = NumberFormat("### €");

  @override
  Widget build(BuildContext context) {
    _loadOptionPayantes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réservation'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          _buildResume(),
          _buildDates(),
          _buildNbPersonnes(),
          _buildOptionsPayantes(context),
          TotalWidget(prix: widget._habitation.prixmois),
          _buildRentButton(),
        ],
      ),
    );
  }

  _buildResume() {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Expanded(
        child: ListTile(
          leading: const Icon(Icons.home),
          title: Text(widget._habitation.libelle),
          subtitle: Text(widget._habitation.adresse),
        ),
      ),
    );
  }

  _buildDates() {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('dd/MM/yyyy').format(dateDebut)),
                  const CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.purple,
                    child: Icon(
                      Icons.arrow_forward,
                      size: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(dateFin))
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  dateTimeRangePicker();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildNbPersonnes() {
    return Container(
        margin: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                'Nombre de personnes :',
                style: LocationTextStyle.boldTextStyle,
              ),
            ),
            DropdownButton(
              value: nbPersonnes,
              items: const [
                DropdownMenuItem(
                  value: '1',
                  child: Text('1'),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text('2'),
                ),
                DropdownMenuItem(
                  value: '3',
                  child: Text('3'),
                ),
                DropdownMenuItem(
                  value: '4',
                  child: Text('4'),
                ),
                DropdownMenuItem(
                  value: '5',
                  child: Text('5'),
                ),
                DropdownMenuItem(
                  value: '6',
                  child: Text('6'),
                ),
                DropdownMenuItem(
                  value: '7',
                  child: Text('7'),
                ),
                DropdownMenuItem(
                  value: '8',
                  child: Text('8'),
                )
              ],
              onChanged: (String? value) {
                setState(() {
                  nbPersonnes = value!;
                });
              },
            ),
          ],
        ));
  }

  _loadOptionPayantes() {
    if (optionPayanteChecks.isEmpty) {
      for (var element in widget._habitation.optionsPayantes) {
        optionPayanteChecks.add(OptionPayanteCheck(
            element.id, element.libelle, false,
            description: element.description, prix: element.prix));
      }
    }
  }

  _buildOptionsPayantes(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
            spacing: 2.0,
            children: Iterable.generate(
                optionPayanteChecks.length,
                (i) => Expanded(
                      child: CheckboxListTile(
                        value: optionPayanteChecks[i].checked,
                        selected: optionPayanteChecks[i].checked,
                        onChanged: (value) => setState(() {
                          optionPayanteChecks[i].checked = value!;
                        }),
                        secondary: const Icon(Icons.shopping_cart),
                        title: Text(optionPayanteChecks[i].libelle,
                            style: LocationTextStyle.boldTextStyle),
                        subtitle: Text(optionPayanteChecks[i].description,
                            style: LocationTextStyle.regularGreyTextStyle),
                      ),
                    )).toList()));
  }

  _buildRentButton() {
    return Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            onPressed: () {
              print('Location init : $nbPersonnes');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            child: const Text('Louer')));
  }

  dateTimeRangePicker() async {
    DateTimeRange? datePicked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDateRange: DateTimeRange(start: dateDebut, end: dateFin),
      cancelText: 'Annuler',
      confirmText: 'Valider',
      locale: const Locale("fr", "FR"),
    );
    if (datePicked != null) {
      setState(() {
        dateDebut = datePicked.start;
        dateFin = datePicked.end;
      });
    }
  }
}
