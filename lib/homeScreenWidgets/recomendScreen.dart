import 'package:flutter/material.dart';
import 'package:movieapp/homeScreenWidgets/rate.dart';
import 'package:movieapp/model/constant.dart';

class RecomendScreen extends StatelessWidget {
  RecomendScreen({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

//Results results;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // width: double.infinity,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 190,
                width: 105,
                child: Column(
                  children: [
                    Image.network(
                      "${Constant.imagePathe}${snapshot.data[index]!.posterPath}",
                      width: 105,
                      height: 130,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                    Expanded(child: Rate(results: snapshot.data![index]))
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: snapshot.data.length,
      ),
    );
  }
}
