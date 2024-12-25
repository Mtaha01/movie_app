part of 'browse_cubit.dart';

@immutable
sealed class BrowseState {}

final class BrowseInitial extends BrowseState {}

final class GetCategoriesLoading extends BrowseState {}
final class GetCategoriesSuccess extends BrowseState {}
final class GetCategoriesError extends BrowseState {}
