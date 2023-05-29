import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) => context.read<BottomNavBarCubit>().selectTab(index),
          items: navBarEl.entries
              .map((entry) => getNavBarItem(entry.key, entry.value))
              .toList(),
        );
      },
    );
  }

  BottomNavigationBarItem getNavBarItem(String title, Icon icon) =>
      BottomNavigationBarItem(
        icon: icon,
        label: title,
      );
}
