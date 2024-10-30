import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/features/map/data/models/place_suggestion.dart';
import 'package:flutter_maps/features/map/logic/cubit/maps_cubit.dart';
import 'package:flutter_maps/features/map/ui/widgets/place_item.dart';

class SuggestionsBloc extends StatelessWidget {
  final Function(PlaceSuggestion) onPlaceSelected;

  const SuggestionsBloc({required this.onPlaceSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          final places = (state).places;
          return places.isNotEmpty ? _buildPlacesList(places) : Container();
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildPlacesList(List<PlaceSuggestion> places) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            onPlaceSelected(places[index]);
          },
          child: PlaceItem(
            placeSuggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
