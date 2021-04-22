import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFFFFFFF);

  static const Color instagramRed = Color(0xFFF25517);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFFF25517), Color(0xFFDF841B)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
