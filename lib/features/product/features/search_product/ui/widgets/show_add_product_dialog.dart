import 'package:flutter/material.dart';

Future<T?> showAddProductDialog<T>({
  required BuildContext context,
}) async {
  final controller = TextEditingController();
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add a product'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Product Name'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: controller,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              Navigator.of(context).pop(controller.text);
            },
          ),
        ],
      );
    },
  );
}
