import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '2_application/bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import '2_application/pages/home_initial_page.dart';
import '2_application/widgets/drawer/drawer_menu.dart';
import '2_application/widgets/home_appbar.dart';
import '2_application/widgets/home_background.dart';
import '2_application/widgets/home_bottom_nav_bar.dart';

class HomeIndex extends StatelessWidget {
  const HomeIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeBackground(),
        BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.transparent,
            appBar: state.index == 0
                ? const HomeAppbar()
                : AppBar(title: Text(state.name)),
            endDrawer: const DrawerMenu(),
            body: getHomeElement(state.index),
            bottomNavigationBar: const HomeBottomNavigationBar(),
          ),
        ),
      ],
    );
  }

  Widget getHomeElement(int index) => [
        const HomeInitialPage(),
        const HomeSupportPage(), //TODO replace with your widget and remove the example
        const HomeEmergencyPage(), //TODO replace with your widget and remove the example
      ].elementAt(index);
}

//TODO replace with your widget and remove the example
class HomeSupportPage extends StatelessWidget {
  const HomeSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Soporte")),
        );
  }
}

//TODO replace with your widget and remove the example
class HomeEmergencyPage extends StatelessWidget {
  const HomeEmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Emergencias")),
        );
  }
}
