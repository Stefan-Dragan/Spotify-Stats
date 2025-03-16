class TrackModel {
  final String id;
  final String name;
  final String author;
  final String image300;
  final String image64;
  final double valence;
  final double energy;

  TrackModel({
    required this.id,
    required this.name,
    required this.author,
    required this.image300,
    required this.image64,
    required this.valence,
    required this.energy,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      image300: json['image300'],
      image64: json['image64'],
      valence: json['valence'],
      energy: json['energy'],
    );
  }
}