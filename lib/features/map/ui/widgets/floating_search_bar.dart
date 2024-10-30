import 'package:flutter/material.dart';
import 'package:flutter_maps/core/constants/styles_colors/my_colors.dart';
import 'package:flutter_maps/features/map/data/models/place.dart';
import 'package:flutter_maps/features/map/data/models/place_directions.dart';
import 'package:flutter_maps/features/map/data/models/place_suggestion.dart';
import 'package:flutter_maps/features/map/ui/widgets/directions_bloc.dart';
import 'package:flutter_maps/features/map/ui/widgets/selected_place_location_bloc.dart';
import 'package:flutter_maps/features/map/ui/widgets/suggestions_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchBarWidget extends StatelessWidget {
  final FloatingSearchBarController controller;
  final Function(PlaceSuggestion) onPlaceSelected;
  final Function(String) getPlacesSuggestions;
  final Function() removeAllMarkersAndUpdateUI;
  final Function() getSelectedPlaceLocation;
  final Function(Place) onPlaceLocationLoaded;
  final Function(PlaceDirections) onDirectionsLoaded;
  final bool isTimeAndDistanceVisible;
  final Function() closeSearchBar;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.onPlaceSelected,
    required this.getPlacesSuggestions,
    required this.removeAllMarkersAndUpdateUI,
    required this.getSelectedPlaceLocation,
    required this.onPlaceLocationLoaded,
    required this.onDirectionsLoaded,
    required this.isTimeAndDistanceVisible,
    required this.closeSearchBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      hint: 'Find a place..',
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 52,
      iconColor: MyColors.blue,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        getPlacesSuggestions(query);
      },
      onFocusChanged: (_) {
        closeSearchBar();
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(Icons.place, color: Colors.black.withOpacity(0.6)),
              onPressed: () {}),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SuggestionsBloc(
                onPlaceSelected: (placeSuggestion) {
                  onPlaceSelected(placeSuggestion);
                  controller.close();
                  getSelectedPlaceLocation();
                  removeAllMarkersAndUpdateUI();
                },
              ),
              SelectedPlaceLocationBloc(
                onPlaceLocationLoaded: (selectedPlace) {
                  onPlaceLocationLoaded(selectedPlace);
                  // هنا يمكنك إضافة كود إضافي إذا لزم الأمر
                },
              ),
              PlaceDirectionsBloc(
                onDirectionsLoaded: (PlaceDirections directions) {
                  onDirectionsLoaded(directions);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
