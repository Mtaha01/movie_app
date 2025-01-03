part of 'category_filtered_cubit.dart';

@immutable
sealed class CategoryFilteredState {}

final class CategoryFilteredInitial extends CategoryFilteredState {}

final class CategoryFilteredLoading extends CategoryFilteredState {}

final class CategoryFilteredError extends CategoryFilteredState {}

final class CategoryFilteredSuccess extends CategoryFilteredState {}
