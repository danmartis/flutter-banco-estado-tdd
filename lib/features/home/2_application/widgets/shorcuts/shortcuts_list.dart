import 'package:flutter/material.dart';

import 'shorcuts_card.dart';

const shortcutsEl = {
  'Autorizar Transferencias': Icon(Icons.money_outlined),
  'Ejemplo1': Icon(Icons.safety_check),
  'Ejemplo2': Icon(Icons.earbuds_battery_sharp),
  'Ejemplo3': Icon(Icons.earbuds_battery_sharp),
  'Ejemplo4': Icon(Icons.earbuds_battery_sharp),
};

class ShortcutsList extends StatelessWidget {
  const ShortcutsList({super.key, required this.leftPadding});

  final double height = 150;
  final double width = 120;
  final double leftPadding;
  final double spaceBetween = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: EdgeInsets.only(left: leftPadding),
        scrollDirection: Axis.horizontal,
        itemCount: shortcutsEl.length,
        separatorBuilder: (context, index) => SizedBox(width: spaceBetween),
        itemBuilder: (context, index) => ShortcutsCard(
          icon: shortcutsEl.values.elementAt(index),
          text: shortcutsEl.keys.elementAt(index),
          width: width,
        ),
      ),
    );
  }
}
