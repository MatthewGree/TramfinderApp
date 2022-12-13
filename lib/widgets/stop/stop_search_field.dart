import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tramfinder_app/common/utils.dart';

import '../../api/model/incoming/stop.dart';

class _StopSearchFieldState extends State<StopSearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: responsiveFromWidth(context, 0.01),
          top: responsiveFromHeight(context, 0.01)
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsiveFromWidth(context, 0.7, min: 100),
          minWidth: 50
        ),
        child: _searchField(Theme.of(context)),
      ),
    );
  }

  SearchField _searchField(ThemeData theme) {
    return SearchField(
      suggestions: widget.stops
          .map((stop) => SearchFieldListItem<Stop>(stop.name, item: stop))
          .toList(),
      suggestionState: Suggestion.expand,
      textInputAction: TextInputAction.next,
      suggestionAction: SuggestionAction.unfocus,
      hint: widget.hint,
      hasOverlay: true,
      maxSuggestionsInViewPort: 5,
      searchInputDecoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.focusColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.dividerColor))
      ),
      itemHeight: 50,
      onSuggestionTap: (stop) => {
        if (stop.item != null) {widget.onSelect(stop.item!)}
      },
    );
  }
}

class StopSearchField extends StatefulWidget {
  final List<Stop> stops;
  final void Function(Stop) onSelect;
  final String hint;

  const StopSearchField(
      {super.key,
      required this.stops,
      required this.onSelect,
      required this.hint});

  @override
  State<StatefulWidget> createState() => _StopSearchFieldState();
}
