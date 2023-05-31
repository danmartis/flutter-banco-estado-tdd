import 'package:flutter/material.dart';

import '../../../../../configs/colors.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const double drawerHeight = double.infinity;
    final double drawerWidth = MediaQuery.of(context).size.width * 0.8;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      color: AppColors.greyBackground,
      width: drawerWidth,
      height: drawerHeight,
      child: _drawerBody(context),
    );
  }

  Widget _drawerBody(BuildContext context) => Container();
}
