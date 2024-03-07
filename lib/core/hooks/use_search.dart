import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef SearchHookRecord = (SearchController, Function(String));

SearchHookRecord useSearch({Function(String)? onChanged}) {
  final controller = useSearchController();

  Timer? debounce;

  void onChangedDebounce(String value) {
    if (debounce?.isActive == true) {
      debounce?.cancel();
    }

    debounce = Timer(const Duration(milliseconds: 500), () {
      if (controller.isOpen) {
        controller.closeView(value);
      }
      onChanged?.call(value);
    });
  }

  useEffect(() {
    return debounce?.cancel;
  }, []);

  return (
    controller,
    onChangedDebounce,
  );
}
