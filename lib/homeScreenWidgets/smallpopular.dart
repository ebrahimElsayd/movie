import 'package:flutter/material.dart';
import 'package:movieapp/model/constant.dart';

import '../model/Results.dart';

class Small extends StatelessWidget {
  Small({super.key, required this.results, required this.snapshot});

  final AsyncSnapshot snapshot;
  Results results;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),

            // border: Border.all(color: )
          ),
          margin: EdgeInsets.all(5),
          width: 140,
          height: 210,
          child: Image.network(
            "${Constant.imagePathe}${results.posterPath}",
            alignment: Alignment.bottomLeft,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
}
