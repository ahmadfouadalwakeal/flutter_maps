import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/styles_colors/my_colors.dart';
import 'package:flutter_maps/features/map/data/models/place_suggestion.dart';

class PlaceItem extends StatelessWidget {
  final PlaceSuggestion placeSuggestion;
  const PlaceItem({super.key, required this.placeSuggestion});

  @override
  Widget build(BuildContext context) {
    var subTitle = placeSuggestion.description
        .replaceAll(placeSuggestion.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: MyColors.lightBlue),
              child: const Icon(
                Icons.place,
                color: MyColors.blue,
              ),
            ),
            title: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                  text: '${placeSuggestion.description.split(',')[0]}\n',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: subTitle.substring(2),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
