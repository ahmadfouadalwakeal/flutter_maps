import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/features/map/logic/cubit/maps_cubit.dart';

class SelectedPlaceLocationBloc extends StatelessWidget {
  final Function onPlaceLocationLoaded;

  const SelectedPlaceLocationBloc(
      {required this.onPlaceLocationLoaded, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlacesLocationLoaded) {
          final selectedPlace = (state).place;
          onPlaceLocationLoaded(selectedPlace);
        }
      },
      child: Container(),
    );
  }
}
