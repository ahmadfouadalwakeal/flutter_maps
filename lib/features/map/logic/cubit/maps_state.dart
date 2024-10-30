part of 'maps_cubit.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<PlaceSuggestion> places;

  PlacesLoaded(this.places);
}

class PlacesLocationLoaded extends MapsState {
  final Place place;

  PlacesLocationLoaded(this.place);
}

class PlacesDirectionLoaded extends MapsState {
  final PlaceDirections direction;

  PlacesDirectionLoaded(this.direction);
}
