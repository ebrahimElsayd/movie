import 'package:flutter/material.dart';
import 'package:movieapp/model/constant.dart';

class ReleasesScreen extends StatefulWidget {
  final AsyncSnapshot snapshot;

  ReleasesScreen(this.snapshot, {super.key});

  @override
  State<ReleasesScreen> createState() => _ReleasesScreenState();
}

class _ReleasesScreenState extends State<ReleasesScreen> {
  String isSave = "assets/images/bookmark.png";

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
                  child: Stack(
                    children: [
                      Image.network(
                        "${Constant.imagePathe}${widget.snapshot.data![index].posterPath}",
                        width: 100,
                        height: 130,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                      Positioned(
                        right: 59,
                        bottom: 98,
                        child: FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            onPressed: () {
                              isSave = ("assets/images/bookmarkright.png");
                              setState(() {});
                            },
                            child: Image.asset(
                              "${isSave}",
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: widget.snapshot.data.length,
        ),
      ),
    );
  }
}
