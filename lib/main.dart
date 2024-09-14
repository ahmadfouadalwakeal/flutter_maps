import 'package:flutter/material.dart';
import 'package:flutter_maps/core/routing/app_router.dart';
import 'package:flutter_maps/maps_app.dart';

void main() {
  runApp(MapsApp(
    appRouter: AppRouter(),
  ));
}
