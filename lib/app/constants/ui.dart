import 'package:flutter/material.dart';

class UI {
  static final colour = Colours();

  static final font = Fonts();
}

class Colours {
  get BACKGROUND => Colors.green.shade100;

  get PRIMARY => Colors.blue;

  get ACCENT => Colors.orange.shade700;

  static final LIGHT_GREY = Colors.grey.shade300;
}

class Fonts {
  TextStyle H1 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  TextStyle get H2 => const TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black);

  TextStyle get H3 => const TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black);

  TextStyle get H => TextStyle(
      fontSize: 14, color: UI.colour.ACCENT, fontWeight: FontWeight.w600);
}
