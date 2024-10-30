import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/features/map/data/models/place.dart';
import 'package:flutter_maps/features/map/data/models/place_directions.dart';
import 'package:flutter_maps/features/map/data/models/place_suggestion.dart';
import 'package:flutter_maps/features/map/data/repos/maps_repo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepo mapsRepo;
  MapsCubit(this.mapsRepo) : super(MapsInitial());
  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepo.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepo.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlacesLocationLoaded(place));
    });
  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepo.getDirections(origin, destination).then((directions) {
      emit(PlacesDirectionLoaded(directions));
    });
  }
}
