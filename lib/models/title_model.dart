class TitleModel {
  final String title;
  final String type;
  final String genres;
  final int releaseYear;
  final String imageUrl;
  final String synopsi;
  final dynamic rating;

  TitleModel({
    required this.title,
    required this.type,
    required this.genres,
    required this.releaseYear,
    required this.imageUrl,
    required this.synopsi,
    required this.rating,
  });

  factory TitleModel.fromJson(Map<String, dynamic> json) {

    return TitleModel(
      title: json['titleText']['text'] ?? '',
      type: json['titleType']['text'] ?? '',
      genres: json['genres'],
      releaseYear: json['releaseYear']['year'],
      imageUrl: json['primaryImage']['url'],
      synopsi: json['plot']?['plotText']?['plainText'] ?? '',
      rating: json['ratingsSummary']?['aggregateRating'] ?? '',
    );
  }
}
