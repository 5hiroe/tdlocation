import 'package:flutter/material.dart';
import 'package:tdlocation/share/location_text_style.dart';

class TotalWidget extends StatelessWidget {
  final double prix;
  const TotalWidget({required this.prix, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Text('TOTAL :',
                      style: LocationTextStyle.boldBigTextStyle))),
          Text(
            '${prix.toStringAsFixed(2)} €',
            style: LocationTextStyle.boldBigTextStyle,
          ),
        ],
      ),
    );
  }
}
