// import 'package:get/get.dart';

// import '../../data/model/top_user_model.dart';

// class LeaderboardController extends GetxController {
//   final topUsers = <TopUser>[
//     TopUser(
//       name: "Eiden",
//       score: 80,
//       rank: 2,
//       image: "https://i.pravatar.cc/150?img=11",
//       email: "Eiden@gtmail.com",
//     ),
//     TopUser(
//       name: "You",
//       score: 85,
//       rank: 1,
//       image: "https://i.pravatar.cc/150?img=12",
//       isYou: true,
//       email: "Eiden@gtmail.com",
//     ),
//     TopUser(
//       name: "Eiden",
//       score: 75,
//       rank: 3,
//       image: "https://i.pravatar.cc/150?img=13",
//       email: "Eiden@gtmail.com",
//     ),
//   ];

//   final leaderboard = <LeaderboardUser>[
//     LeaderboardUser(rank: 4, name: "Ralph Edwards", score: 70),
//     LeaderboardUser(rank: 5, name: "Cameron Williamson", score: 70),
//     LeaderboardUser(rank: 6, name: "Arlene McCoy", score: 60),
//     LeaderboardUser(rank: 7, name: "Guy Hawkins", score: 60),
//     LeaderboardUser(rank: 8, name: "Annette Black", score: 60),
//     LeaderboardUser(rank: 9, name: "Floyd Miles", score: 60),
//   ];

  
// }
import 'package:get/get.dart';
import '../../data/model/top_user_model.dart'; // Adjust path if needed

class LeaderboardController extends GetxController {
  // Top 3 users (podium section - not paginated)
  final topUsers = <TopUser>[
    TopUser(
      name: "Eiden",
      score: 80,
      rank: 2,
      image: "https://i.pravatar.cc/150?img=11",
      email: "Eiden@gtmail.com",
    ),
    TopUser(
      name: "You",
      score: 85,
      rank: 1,
      image: "https://i.pravatar.cc/150?img=12",
      isYou: true,
      email: "you@gtmail.com",
    ),
    TopUser(
      name: "Eiden",
      score: 75,
      rank: 3,
      image: "https://i.pravatar.cc/150?img=13",
      email: "Eiden@gtmail.com",
    ),
  ].obs; // Made observable in case you add refresh later

  // Full list of users from rank 4 onwards
  final allLeaderboardUsers = <LeaderboardUser>[
    LeaderboardUser(rank: 4, name: "Ralph Edwards", score: 70),
    LeaderboardUser(rank: 5, name: "Cameron Williamson", score: 70),
    LeaderboardUser(rank: 6, name: "Arlene McCoy", score: 60),
    LeaderboardUser(rank: 7, name: "Guy Hawkins", score: 60),
    LeaderboardUser(rank: 8, name: "Annette Black", score: 60),
    LeaderboardUser(rank: 9, name: "Floyd Miles", score: 60),
    // Add more users here if you have >9 for testing page 2
    // LeaderboardUser(rank: 10, name: "Test User 10", score: 55),
    // LeaderboardUser(rank: 11, name: "Test User 11", score: 50),
    // ...
  ].obs;

  // Pagination variables
  final int pageSize = 9; // Exactly 9 items per page
  var currentPage = 0.obs;
  var totalPages = 1.obs;

  // Computed: Users for the current page only
  List<LeaderboardUser> get currentPageUsers {
    final start = currentPage.value * pageSize;
    final end = (start + pageSize).clamp(0, allLeaderboardUsers.length);
    return allLeaderboardUsers.sublist(start, end);
  }

  @override
  void onInit() {
    super.onInit();
    _calculateTotalPages();
  }

  void _calculateTotalPages() {
    if (allLeaderboardUsers.isEmpty) {
      totalPages.value = 1;
    } else {
      totalPages.value = (allLeaderboardUsers.length / pageSize).ceil();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void nextPage() {
    if (currentPage.value < totalPages.value - 1) {
      currentPage.value++;
    }
  }

  void goToPage(int page) {
    if (page >= 0 && page < totalPages.value) {
      currentPage.value = page;
    }
  }

  // Optional: If you fetch new data later
  void refreshLeaderboard(List<LeaderboardUser> newUsers) {
    allLeaderboardUsers.assignAll(newUsers);
    _calculateTotalPages();
    currentPage.value = 0; // Reset to first page
  }
}