import 'package:flutter/material.dart';
import 'package:movie_app/models/title_model.dart';
import 'package:movie_app/pages/details_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/providers/title_provider.dart';
import 'package:movie_app/routes/app_route.dart';
import 'package:provider/provider.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TitleProvider(),
        child: const HomePage(),
      ),
      routes: {
        AppRoute.details.name: (context) {
          final data = ModalRoute.of(context)?.settings.arguments as TitleModel?;
          return DetailsPage(
            data: data!,
          );
        }
      },
    );
  }
}
