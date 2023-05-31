import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_state.dart';

const navBarEl = {
  'Inicio': Icon(Icons.home),
  'Soporte': Icon(Icons.support_agent_outlined),
  'Emergencias': Icon(Icons.warning),
};

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit()
      : super(BottomNavBarState(
          index: 0,
          name: navBarEl.keys.elementAt(0),
        ));

  void selectTab(int index) {
    emit(state.copyWith(index: index, name: navBarEl.keys.elementAt(index)));
  }
}
