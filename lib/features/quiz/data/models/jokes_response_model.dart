class JokesResponseModel {
  final String joke;
  final String answer;
  final String imageUrl;

  JokesResponseModel({
    required this.joke,
    required this.answer,
    required this.imageUrl,
  });

  // Factory constructor to create a Joke from JSON
  factory JokesResponseModel.fromJson(Map<String, dynamic> json) {
    return JokesResponseModel(
      joke: json['joke'] ?? '',
      answer: json['answer'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Convert a Joke object to JSON
  Map<String, dynamic> toJson() {
    return {
      'joke': joke,
      'answer': answer,
      'imageUrl': imageUrl,
    };
  }
}
