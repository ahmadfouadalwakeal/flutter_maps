import 'package:dio/dio.dart';
import 'package:flutter_maps/core/constants/api_constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesWebServices {
  late Dio dio;
  PlacesWebServices() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(
        suggestionBaseUrl,
        queryParameters: {
          "input": place,
          "types": 'address',
          "components": 'country:eg',
          "key": googleApiKey,
          "sessiontoken": sessionToken,
        },
      );
      print(response.data['predictions']);
      print(response.statusCode);
      return response.data['predictions'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          "place_id": placeId,
          "fields": 'geometry',
          "key": googleApiKey,
          "sessiontoken": sessionToken,
        },
      );

      return response.data;
    } catch (error) {
      return Future.error('place location error: ',
          StackTrace.fromString(('this is its trace')));
    }
  }

  // origin equals current location
  // destination equals searched for location
  Future<dynamic> getDirections(LatLng origin, LatLng destination) async {
    try {
      Response response = await dio.get(
        directionsBaseUrl,
        queryParameters: {
          "origin": '${origin.latitude},${origin.longitude}',
          "destination": '${destination.latitude},${destination.longitude}',
          "key": googleApiKey,
        },
      );
      print("Omar I'm testing directions");
      print(response.data);
      return response.data;
    } catch (error) {
      return Future.error('place location error: ',
          StackTrace.fromString(('this is its trace')));
    }
  }
}
