import 'package:flutter/material.dart';

class AppDrawerButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function onTap;

  const AppDrawerButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: () => onTap(),
    );
  }
}
