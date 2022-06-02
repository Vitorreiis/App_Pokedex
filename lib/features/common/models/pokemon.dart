class Pokemon {
  final String name;
  final String image;
  final List<String> listType;
  final int id;
  final String num;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['img'],
      id: json['id'],
      num: json['num'],
      listType: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }

  Pokemon({
    required this.name,
    required this.image,
    required this.listType,
    required this.id,
    required this.num,
  });
}
