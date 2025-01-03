part of 'watch_list_cubit.dart';

@immutable
sealed class WatchListState {}

final class WatchListInitial extends WatchListState {}

final class GetWatchListLoading extends WatchListState {}
final class GetWatchListSuccess extends WatchListState {}
final class GetWatchListError extends WatchListState {}
