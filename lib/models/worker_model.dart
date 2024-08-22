class Worker {
  final String id;
  final String name;
  final String location;
  final String contact;
  final List<String> skills;
  final double score;
  final int rank;
  double averageRating;
  int ratingCount;

  Worker({
    required this.id,
    required this.name,
    required this.location,
    required this.contact,
    required this.skills,
    required this.score,
    required this.rank,
    this.averageRating = 0,
    this.ratingCount = 0,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      contact: json['contact'],
      skills: List<String>.from(json['skills']),
      score: json['score'],
      rank: json['rank'],
      averageRating: json['average_rating'],
      ratingCount: json['rating_count'],
    );
  }
}
