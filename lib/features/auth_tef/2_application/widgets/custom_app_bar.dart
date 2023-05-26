import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required String title,
    Widget? leading,
    List<Widget>? actions,
  }) : super(
          key: key,
          title: _AppBarTitle(title: title,),
          actions: actions,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          leading: leading,
          iconTheme: const IconThemeData(
            color: Colors.white
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: _appBarGradient,
            ),
          ),
        );
}

class _AppBarTitle extends StatelessWidget {

  final String title;

  const _AppBarTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title, 
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      )
    );
  }
}

const _appBarGradient = LinearGradient(
  colors: [
    Color(0xFF64707F),
    Color(0xFF26323F),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
