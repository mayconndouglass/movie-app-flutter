import 'package:flutter/material.dart';
import 'package:movie_app/models/title_model.dart';

class MovieCard extends StatelessWidget {
  final TitleModel data;

  const MovieCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Card(
        elevation: 10.0,
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
        color: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Color.fromARGB(255, 255, 117, 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.network(
                      data.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Hero(
                  tag: data.title,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        height: 300,
                        width: 200,
                        child: SizedBox(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Título: ${data.title}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Ano: ${data.releaseYear.toString()}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                        
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gênero: ${data.genre}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      'Tipo: ${data.type}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54
                      ),
                    ),
                     const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 18,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '10.0',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                        ) 
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
