import 'dart:async';

import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.onChanged,
    required this.suggestionList,
  });

  final void Function(String)? onChanged;
  final List<String> suggestionList;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final _controller = SearchController();
  Timer? _debounce;

  void _onChanged(String value) {
    if (_debounce?.isActive == true) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_controller.isOpen) {
        _controller.closeView(value);
      }

      widget.onChanged?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      viewConstraints: BoxConstraints.tight(const Size.fromHeight(300)),
      viewOnChanged: _onChanged,
      viewTrailing: const [],
      searchController: _controller,
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<Widget>.generate(
          widget.suggestionList.length,
          (int index) {
            final String item = widget.suggestionList[index];
            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                  widget.onChanged?.call(item);
                });
              },
            );
          },
        );
      },
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: _onChanged,
          leading: const Icon(Icons.search),
          trailing: const [],
        );
      },
    );
  }
}
