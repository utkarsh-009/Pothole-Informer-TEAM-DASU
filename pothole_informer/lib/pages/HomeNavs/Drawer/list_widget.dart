import 'package:flutter/material.dart';
import 'package:pothole_informer/Models/grid_items.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final GridItems item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, item.route);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                item.icon,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.text,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
