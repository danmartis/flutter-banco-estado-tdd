import 'package:flutter/material.dart';

class CustomCardButton extends StatelessWidget {
  final String cardTitle;
  final Function() onTap;

  const CustomCardButton({super.key, required this.cardTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
      side: const BorderSide(color: Color(0xFFD9DBE0)),
      borderRadius: BorderRadius.circular(8),
    );

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 7,
      shadowColor: Colors.black26,
      color: Colors.white,
      shape: roundedRectangleBorder,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                cardTitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              )),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}