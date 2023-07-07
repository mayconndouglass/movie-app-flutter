import 'package:flutter/material.dart';
import 'package:movie_app/models/title_model.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsPage extends StatelessWidget {
  final TitleModel data;
  final List<String> genres;

  DetailsPage({Key? key, required this.data})
      : genres = data.genres.split(', '),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              const Center(
                child: CircularProgressIndicator(),
              ),
              Hero(
                tag: data.title,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: data.imageUrl,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              children: [
                for (var genre in genres)
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                          child: Text(
                            genre
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      )
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}