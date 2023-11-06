import 'package:flutter/material.dart';
import 'package:movieapp/model/Results.dart';

class Rate extends StatelessWidget {
  Rate({super.key, required this.results});

  Results results;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          ),
          //Text("${snapshot.data.voteAverage.toStringAsFixed(1)}/10")
          Text(
            "${results.voteAverage!.toStringAsFixed(1)}/10",
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
      Text(
        "${results.title}",
        style: TextStyle(
            color: Colors.white, fontSize: 9, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "${results.releaseDate}",
        style: TextStyle(
            color: Colors.white, fontSize: 9, fontWeight: FontWeight.w200),
      )
    ]);
  }
}
