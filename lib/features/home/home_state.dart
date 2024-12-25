part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PopularMoviesLoading extends HomeState {}
final class PopularMoviesError extends HomeState {}
final class PopularMoviesDone extends HomeState {}

final class NewMoviesLoading extends HomeState {}
final class NewMoviesError extends HomeState {}
final class NewMoviesDone extends HomeState {}

final class RecommendedMoviesLoading extends HomeState {}
final class RecommendedMoviesError extends HomeState {}
final class RecommendedMoviesDone extends HomeState {}
