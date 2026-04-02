part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MapLocationDetermining extends MapState {}

final class MapLocationDetermined extends MapState {
  final Position position;

  MapLocationDetermined(this.position);
}
