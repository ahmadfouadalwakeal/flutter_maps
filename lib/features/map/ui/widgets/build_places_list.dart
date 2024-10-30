import 'package:flutter/material.dart';
import 'package:flutter_maps/features/map/data/models/place_suggestion.dart';
import 'package:flutter_maps/features/map/ui/widgets/place_item.dart';

class BuildPlacesList extends StatelessWidget {
  const BuildPlacesList({
    super.key,
    required this.places,
    required this.onTap,
  });
  final List<PlaceSuggestion> places;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () => onTap(index),
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
