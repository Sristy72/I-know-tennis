class JokesResponseModel {
  final String joke;
  final String jokeAnswer;
  final String imageUrl;

  JokesResponseModel({
    required this.joke,
    required this.jokeAnswer,
    required this.imageUrl,
  });

  // Factory constructor to create a Joke from JSON
  factory JokesResponseModel.fromJson(Map<String, dynamic> json) {
    return JokesResponseModel(
      joke: json['joke'] ?? '',
      jokeAnswer: json['jokeAnswer'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Convert a Joke object to JSON
  Map<String, dynamic> toJson() {
    return {
      'joke': joke,
      'answer': jokeAnswer,
      'imageUrl': imageUrl,
    };
  }
}
