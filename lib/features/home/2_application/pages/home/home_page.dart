import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'widgets/widgets.dart';
// import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 1;
    var currentTitle = 'Noticias';

    void onItemTap(int index) {
      selectedIndex = index;

      switch (index) {
        case 0:
          currentTitle = '';
          break;
        case 1:
          currentTitle = '';
          break;
        case 2:
          currentTitle = '';
          break;
        case 3:
          currentTitle = '';
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('HOME4'),
      ),
      drawer: AppDrawer(
        userName: 'Andro Ostoic',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HOME'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.push('/transfers'),
              child: const Text('Go To Transfers'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.push('/beneficiaries'),
              child: const Text('Go To beneficiaries'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.push('/auth_tef'),
              child: const Text('Go To Auth Tef'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => context.pushReplacement('/auth'),
              child: const Text('salir'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) => onItemTap(index),
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.peopleArrows),
            label: 'Beneficiarios',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.moneyBillTransfer),
            label: 'Transferencias',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userAstronaut),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
