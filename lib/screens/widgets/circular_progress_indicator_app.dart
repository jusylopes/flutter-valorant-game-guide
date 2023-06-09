import 'package:flutter/material.dart';
import 'package:flutter_valorant_game_guide/resources/colors.dart';

class CircularProgressIndicatorApp extends StatelessWidget {
  const CircularProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: ValorantColors.secondaryColor,
    ));
  }
}
