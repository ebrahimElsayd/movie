import 'package:flutter/material.dart';
import 'package:movieapp/homeScreenWidgets/details/detailss.dart';
import 'package:movieapp/homeScreenWidgets/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        iconTheme: IconThemeData(
            size: 10
        //  color: Colors.white
        )
      ),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        MovieDetails.routName:(_)=>MovieDetails()
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
