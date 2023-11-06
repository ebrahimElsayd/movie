import 'package:flutter/material.dart';
import 'package:movieapp/model/constant.dart';

class ReleasesScreen extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const ReleasesScreen(this.snapshot, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xEF282A28),
      child: SizedBox(
        width: double.infinity,
        // width: double.infinity,
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 140,
                  width: 100,
                  child: Image.network(
                    "${Constant.imagePathe}${snapshot.data[index].posterPath}",
                    width: 100,
                    height: 130,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            );
          },
          itemCount: snapshot.data.length,
        ),
      ),
    );
  }
}
