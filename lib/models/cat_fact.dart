class CatFact {
  final String fact;
  final DateTime createdAt;

  CatFact({required this.fact, required this.createdAt});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      fact: json['text'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}