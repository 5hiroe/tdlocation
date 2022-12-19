import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdlocation/share/location_style.dart';

class LocationTextStyle {
  static final baseTextStyle =
      GoogleFonts.getFont('Raleway').copyWith(color: LocationStyle.colorPurple);

  static final regularTextStyle = baseTextStyle.copyWith(fontSize: 13.0);

  static final regularWhiteTextStyle =
      baseTextStyle.copyWith(fontSize: 13.0, color: Colors.white70);

  static final boldTextStyle =
      baseTextStyle.copyWith(fontWeight: FontWeight.bold);
}
