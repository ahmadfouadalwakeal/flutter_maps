import 'package:flutter_maps/features/map/data/models/place.dart';
import 'package:flutter_maps/features/map/data/models/place_directions.dart';
import 'package:flutter_maps/features/map/data/models/place_suggestion.dart';
import 'package:flutter_maps/features/map/data/web_services/places_web_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsRepo {
  final PlacesWebServices placesWebServices;

  MapsRepo(this.placesWebServices);
  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);
    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
        await placesWebServices.getPlaceLocation(placeId, sessionToken);
    var readyPlace = Place.fromJson(place);
    return readyPlace;
  }

  Future<PlaceDirections> getDirections(
      LatLng origin, LatLng destination) async {
    final directions =
        await placesWebServices.getDirections(origin, destination);
    var readyPlace = PlaceDirections.fromJson(directions);
    return readyPlace;
  }
}
