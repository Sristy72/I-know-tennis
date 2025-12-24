import 'package:get/get.dart';

import '../../data/model/top_user_model.dart';

class LeaderboardController extends GetxController {
  final topUsers = <TopUser>[
    TopUser(
      name: "Eiden",
      score: 80,
      rank: 2,
      image: "https://i.pravatar.cc/150?img=11",
    ),
    TopUser(
      name: "You",
      score: 85,
      rank: 1,
      image: "https://i.pravatar.cc/150?img=12",
      isYou: true,
    ),
    TopUser(
      name: "Eiden",
      score: 75,
      rank: 3,
      image: "https://i.pravatar.cc/150?img=13",
    ),
  ];

  final leaderboard = <LeaderboardUser>[
    LeaderboardUser(rank: 4, name: "Ralph Edwards", score: 70),
    LeaderboardUser(rank: 5, name: "Cameron Williamson", score: 70),
    LeaderboardUser(rank: 6, name: "Arlene McCoy", score: 60),
    LeaderboardUser(rank: 7, name: "Guy Hawkins", score: 60),
    LeaderboardUser(rank: 8, name: "Annette Black", score: 60),
    LeaderboardUser(rank: 9, name: "Floyd Miles", score: 60),
  ];
}
