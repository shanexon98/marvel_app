class Character {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> comics;
  final List<String> series;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.comics,
    required this.series,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl:
          '${json['thumbnail']['path']}/portrait_xlarge.${json['thumbnail']['extension']}',
      comics: List<String>.from(
          json['comics']['items'].map((comic) => comic['name'])),
      series: List<String>.from(
          json['series']['items'].map((serie) => serie['name'])),
    );
  }
}
