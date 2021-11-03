// ignore_for_file: unused_local_variable, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pothole/Models/grid_items.dart';

import '../../Models/grid_items.dart';
import '../../widgets/GridWidgets/custom_grid_tile.dart';

class CustomGrid extends StatelessWidget {
  int rows = 3;
  int columns = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
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
                          image: Items[0][0].image,
                          text: Items[0][0].text,
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
