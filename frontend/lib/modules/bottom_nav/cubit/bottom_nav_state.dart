part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  final int index;
  const BottomNavState({
    required this.index,
  });

  @override
  List<Object> get props => [index];

  factory BottomNavState.initial() => const BottomNavState(index: 1);

  BottomNavState copyWith({
    int? index,
  }) {
    return BottomNavState(
      index: index ?? this.index,
    );
  }
}
