import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/hooks/use_search.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppSearchBar extends HookWidget {
  const AppSearchBar({
    super.key,
    required this.onChanged,
    required this.suggestionList,
  });

  final void Function(String)? onChanged;
  final List<String> suggestionList;

  @override
  Widget build(BuildContext context) {
    var (controller, onChangedDebounce) = useSearch(onChanged: onChanged);

    return SearchAnchor(
      isFullScreen: false,
      viewConstraints: BoxConstraints.tight(const Size.fromHeight(300)),
      viewOnChanged: onChangedDebounce,
      viewTrailing: const [],
      searchController: controller,
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<Widget>.generate(
          suggestionList.length,
          (int index) {
            final String item = suggestionList[index];
            return ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(item),
              onTap: () {
                controller.closeView(item);
                onChangedDebounce.call(item);
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
          onChanged: onChangedDebounce,
          leading: const Icon(Icons.search),
          trailing: const [],
        );
      },
    );
  }
}
