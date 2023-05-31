import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(right: 16), // Margen a la derecha
          child: IconButton(
            icon: Icon(
              Icons.menu, // Icono personalizado aquí
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        );
      },
    );
  }
}
