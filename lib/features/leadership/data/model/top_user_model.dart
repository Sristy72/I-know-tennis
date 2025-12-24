class TopUser {
  final String name;
  final int score;
  final int rank;
  final String image;
  final bool isYou;

  TopUser({
    required this.name,
    required this.score,
    required this.rank,
    required this.image,
    this.isYou = false,
  });
}

class LeaderboardUser {
  final int rank;
  final String name;
  final int score;

  LeaderboardUser({
    required this.rank,
    required this.name,
    required this.score,
  });
}
