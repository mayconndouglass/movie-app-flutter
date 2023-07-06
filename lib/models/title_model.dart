class TitleModel {
  final String title;
  final String type;
  final String genre;
  final int releaseYear;
  final String imageUrl;

  TitleModel({
    required this.title,
    required this.type,
    required this.genre,
    required this.releaseYear,
    required this.imageUrl,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) {
    return TitleModel(
      title: json['titleText']['text'] ?? '',
      type: json['titleType']['text'] ?? '',
      genre: json['genre'] ?? 'Gênero desconhecido',
      releaseYear: json['releaseYear']['year'],
      imageUrl: json['primaryImage']['url'],
    );
  }
}
