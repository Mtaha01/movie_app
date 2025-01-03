part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}
final class SimilarMoviesLoading extends MovieDetailsState {}
final class SimilarMoviesError extends MovieDetailsState {}
final class SimilarMoviesSuccess extends MovieDetailsState {}
