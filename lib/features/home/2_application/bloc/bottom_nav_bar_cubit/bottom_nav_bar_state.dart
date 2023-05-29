part of 'bottom_nav_bar_cubit.dart';

class BottomNavBarState extends Equatable {
  const BottomNavBarState({required this.index, required this.name});

  final int index;
  final String name;

  BottomNavBarState copyWith({
    int? index,
    String? name,
  }) {
    return BottomNavBarState(
      index: index ?? this.index,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [index, name];
}
