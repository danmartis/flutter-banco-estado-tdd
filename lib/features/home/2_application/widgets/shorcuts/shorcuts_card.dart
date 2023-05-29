import 'package:flutter/material.dart';

class ShortcutsCard extends StatelessWidget {
  const ShortcutsCard({
    super.key,
    required this.icon,
    required this.text,
    required this.width,
  });

  final Icon icon;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            _setText(),
          ],
        ),
      ),
    );
  }

  Widget _setText() => Text(
        text,
        textAlign: TextAlign.center,
      );
}
