import 'package:flutter/material.dart';
import 'package:pothole_informer_app/custom%20layouts/custom_grid_tile.dart';
import 'package:pothole_informer_app/models/grid_items.dart';

class CustomGrid extends StatelessWidget {
  final rows = 3;
  final columns = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      height: MediaQuery.of(context).size.width * rows / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          rows,
          (r) {
            return Expanded(
              child: Row(
                children: List.generate(
                  columns,
                  (c) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomGridTile(
                          image: items[r][c].image,
                          text: items[r][c].text,
                          route: items[r][c].route,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
