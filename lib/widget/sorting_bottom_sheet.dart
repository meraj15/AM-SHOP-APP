import 'package:flutter/material.dart';

class SortingBottomSheet extends StatelessWidget {
  final Function(String) onSelect;

  const SortingBottomSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text(
            'Sort By',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon:const Icon(Icons.close),
          ),
        ),
        ListTile(
          title: const Text('Price : High to Low'),
          onTap: () {
            onSelect('High to Low');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Price : Low to High'),
          onTap: () {
            onSelect('Low to High');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Rating : Best Rating'),
          onTap: () {
            onSelect('Best Rating');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
