import 'package:flutter/material.dart';
import 'package:movie_app/providers/title_provider.dart';
import 'package:movie_app/widgets/title_card.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedGenre = '';
  int currentPage = 1;
  late List<dynamic> genreList;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<TitleProvider>(context, listen: false).loadData();
      genreList = await Provider.of<TitleProvider>(context, listen: false).fetchGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TitleProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          appBar: AppBar(
            title: const Text('Movie App'),
            titleTextStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            elevation: 16.0,
            centerTitle: true,
            backgroundColor: Colors.black87,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _openGenreDropdown(provider);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => provider.loadData(),
                  child: ListView.builder(
                    itemCount: provider.titleList.length,
                    itemBuilder: (context, index) {
                      final data = provider.titleList[index];
                      return MovieCard(data: data);
                    },
                  ),
                ),
              ),
              NumberPaginator(
                numberPages: 20,
                onPageChange: (page) {
                  setState(() {
                    currentPage = page;
                  });

                  provider.loadData(genre: selectedGenre, page: page + 1);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _openGenreDropdown(provider) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Selecione um gênero'),
        content: DropdownButton<String>(
          value: selectedGenre.isNotEmpty ? selectedGenre : null,
          onChanged: (newValue) {
            setState(() {
              selectedGenre = newValue!;
            });
            provider.loadData(genre: selectedGenre, page: currentPage);
            Navigator.pop(context);
          },
          items: [
            const DropdownMenuItem<String>(
              value: null,
              child: Text('Selecionar gênero'),
            ),
            ...genreList.map((genre) {
              return DropdownMenuItem<String>(
                value: genre,
                child: Text(genre),
              );
            }).toList(),
          ],
        ),
      );
    },
  );
}


}
