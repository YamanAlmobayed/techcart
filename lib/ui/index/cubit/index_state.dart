part of 'index_cubit.dart';

@immutable
sealed class IndexState {}

final class IndexInitial extends IndexState {}

final class ResetBottomNavBarIndex extends IndexState {}

final class ChangeBottomNavBarIndex extends IndexState {}
