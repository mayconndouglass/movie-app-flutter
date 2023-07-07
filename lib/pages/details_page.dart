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
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text(data.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              /* const Center(
                child: CircularProgressIndicator(),
              ), */
              Hero(
                tag: data.title,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: data.imageUrl,
                    fit: BoxFit.fitWidth,
                    height: 600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var genre in genres)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                          child: Text(
                            genre,
                            style: const TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),    
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        data.type,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 24
                        ),
                      ),
                      const Text(
                        'Tipo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 24,
                      ),
                      Text(
                        data.rating.toString(),
                        style: const TextStyle(
                           color: Colors.white,
                           fontSize: 20
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                     width: 40,
                  ),
                  Column(
                    children: [
                      Text(
                        data.releaseYear.toString(),
                         style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 24
                        ),
                      ),
                      const Text(
                        'Ano',
                        style: TextStyle(
                          color: Colors.white,
                              fontSize: 20
                        ),
                      )
                    ],
                  ),
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Descrição:',
                  style: 
                    TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),
                ),
                const SizedBox(height: 10,),
                Text(
                  data.synopsi,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}