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
  @override
  void initState() {
    super.initState();
    Provider.of<TitleProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Criado por Maycon Douglas'),
          duration: Duration(seconds: 5),
        ),
      );
    });

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
                      }
                    ),
                ), 
              ),
              NumberPaginator(
                numberPages: 20,
                onPageChange: (page) {
                  provider.loadData(page: page);
                },
              )
            ],
            
          ),
        );
      },
    );
  }
}
