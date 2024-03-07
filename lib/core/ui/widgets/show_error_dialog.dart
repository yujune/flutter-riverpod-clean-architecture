import 'package:flutter/material.dart';

Future<T?> showErrorDialog<T>({
  required BuildContext context,
  required String? message,
}) async {
  return showDialog<T>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content:
            Text(message ?? "Something went wrong, please try again later"),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
