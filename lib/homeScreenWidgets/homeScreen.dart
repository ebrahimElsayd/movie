import 'package:flutter/material.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/homeScreenWidgets/newReleases.dart';
import 'package:movieapp/homeScreenWidgets/popularScreeen.dart';
import 'package:movieapp/homeScreenWidgets/recomendScreen.dart';
import 'package:movieapp/model/Recomended2/rec.dart';
import 'package:movieapp/model/Results.dart';
import 'package:movieapp/model/detail/Details.dart';
import 'package:movieapp/model/recomenRes/recomend.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<List<Results>> popularScreen  ;
  late Future<List<Details>> releasesScreen;
  // late Future<List<Recomend>> recomendedScreen;
  late Future<List<Details>> recomendedScreen;
  // late Future<List<Results>> popularScreen;
  late Future<List<Details>> popularScreen;
  //late Future<List<Rec>> releasesScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularScreen = Api.getPopularResponse();
    releasesScreen = Api.newReleasesResponse();
    recomendedScreen = Api.RecomendedResponse();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        //  backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  //   height: ,
                  child: FutureBuilder(
                    future: popularScreen,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Text(snapshot.error.toString()),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("try again"))
                            ],
                          ),
                        );
                      }
                      //  var  sourcesList = snapshot.data?. ??[];
                      return PopularScreen(
                        snapshot: snapshot,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: Color(0xEF282A28),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Releases ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                          future: releasesScreen,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Column(
                                  children: [
                                    Text(snapshot.error.toString()),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text("try again"))
                                  ],
                                ),
                              );
                            }
                            return ReleasesScreen(snapshot);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: Color(0xEF282A28),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recomended ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        FutureBuilder(
                          future: recomendedScreen,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              print(snapshot.error.toString());
                              return Center(
                                child: Column(
                                  children: [
                                    Text(snapshot.error.toString()),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text("try again"))
                                  ],
                                ),
                              );
                            }
                            //  int index = 0;
                            return RecomendScreen(
                              snapshot: snapshot,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
