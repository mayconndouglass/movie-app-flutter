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
      title: json['titleText']?['text'] ?? '',
      type: json['titleType']?['text'] ?? '',
      genres: json['genres'] ?? '',
      releaseYear: json['releaseYear']?['year'] ?? '',
      imageUrl: json['primaryImage']?['url'] ?? "https://www.sema.rs.gov.br/themes/padrao2019/images/outros/GD_imgSemImagem.png",
      synopsi: json['plot']?['plotText']?['plainText'] ?? 'Sem Descrição',
      rating: json['ratingsSummary']?['aggregateRating'] ?? 'Não Avaliado',
    );
  }
}
