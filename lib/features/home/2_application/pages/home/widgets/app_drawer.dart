import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../configs/colors.dart';
import '../../../../../../configs/decorations.dart';
import 'app_drawer_button.dart';

class AppDrawer extends StatelessWidget {
  final String userName;

  const AppDrawer({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: AppColors.greyBackground,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.circleUser,
                  color: Colors.black,
                  size: size.width * 0.15,
                ),
                const SizedBox(height: 16.0),
                FittedBox(
                  child: Text(
                    userName,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          AppDrawerButton(
            title: 'Transferir',
            icon: FontAwesomeIcons.dollarSign,
            iconColor: AppColors.green100,
            onTap: () => {},
          ),
          AppDrawerButton(
            title: 'Mi Perfil',
            icon: FontAwesomeIcons.userTie,
            iconColor: AppColors.orange100,
            onTap: () => {},
          ),
          AppDrawerButton(
            title: 'BEPASS',
            icon: FontAwesomeIcons.lightbulb,
            iconColor: Colors.lightBlue,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
