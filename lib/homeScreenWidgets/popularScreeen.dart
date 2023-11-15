import 'package:flutter/material.dart';
import 'package:movieapp/homeScreenWidgets/movieName.dart';
import 'package:movieapp/homeScreenWidgets/smallpopular.dart';
import 'package:movieapp/model/constant.dart';

class PopularScreen extends StatelessWidget {
  PopularScreen({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

// Results results;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 200,
      width: double.infinity,
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                      tag: index.toString(),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed(MovieDetails.routName,arguments: snapshot.data![index]);
                        },
                        child: SizedBox(
                          height: 300,
                          //  width: double.infinity,
                          width: 430,
                          child: Image.network(
                            "${Constant.imagePathe}${snapshot.data[index].posterPath}",
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      bottom: 160,
                      right: 190,
                      child: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 60,
                      )),
                  Positioned(
                      bottom: 0,
                      left: 180,
                      child: MovieName(
                          //rec: snapshot.data![index], snapshot: snapshot)),
                          results: snapshot.data![index],
                          snapshot: snapshot)),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Small(

                            // rec: snapshot.data![index],
                            results: snapshot.data![index],
                            snapshot: snapshot)),
                  ),
                ],
              ),
            ),
          );
        },
        // itemCount: 100,
        itemCount: snapshot.data.length,
      ),
    );
  }
}
