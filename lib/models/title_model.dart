class TitleModel {
  final String title;
  final String type;
  final String genres;
  final int releaseYear;
  final String imageUrl;

  TitleModel({
    required this.title,
    required this.type,
    required this.genres,
    required this.releaseYear,
    required this.imageUrl,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) {

    return TitleModel(
      title: json['titleText']['text'] ?? '',
      type: json['titleType']['text'] ?? '',
      genres: json['genres'],
      releaseYear: json['releaseYear']['year'],
      imageUrl: json['primaryImage']['url'],
    );
  }
}
