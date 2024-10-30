import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/features/map/logic/cubit/maps_cubit.dart';

class PlaceDirectionsBloc extends StatelessWidget {
  final Function onDirectionsLoaded;

  const PlaceDirectionsBloc({Key? key, required this.onDirectionsLoaded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlacesDirectionLoaded) {
          onDirectionsLoaded(state.direction);
        }
      },
      child: Container(),
    );
  }
}
