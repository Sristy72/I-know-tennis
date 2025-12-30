import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/core/utils/debug_print.dart';
import 'package:flutter_iknow_tennis/features/leadership/data/model/leaderboard_response_model.dart';
import 'package:flutter_iknow_tennis/features/leadership/domain/repo/leaderboard_repo.dart';
import 'package:get/get.dart';

import '../../data/model/top_user_model.dart';


class LeaderboardController extends BaseController {
  final LeaderboardListRepository _leaderRepository;
  LeaderboardController(this._leaderRepository);

  final Rx<LeaderboardResponse?> leader = Rx<LeaderboardResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchLeaderboard(); // Load first page on init
  }

  // Pagination settings
  final int pageSize = 10;
  final currentPage = 0.obs; // 0-based index for UI (page 1 → index 0)
  final totalPages = 1.obs;

  /// =======================
  /// API CALL
  /// =======================
  Future<void> fetchLeaderboard({int page = 1}) async {
    setLoading(true);

    final result = await _leaderRepository.getLeaderboard(
      page: page,
      limit: pageSize,
    );

    DPrint.log("LeaderboardController fetchLeaderboard page: $page → $result");

    result.fold(
      (fail) {
        setError(fail.message);
        setLoading(false);
      },
      (success) {
        leader.value = success.data;

        // Update pagination state correctly
        final int apiPage = success.data.page; // 1-based from backend
        final int totalItems = success.data.list.length + (apiPage - 1) * pageSize;
        // Better: assume backend sends total count if available, but since it doesn't,
        // we can infer from whether we got full page or not
        // But safest: assume more pages exist unless list < limit

        currentPage.value = apiPage - 1; // Convert to 0-based

        // Conservative totalPages calculation
        // If we got full 10 items, assume there might be more
        // We'll refine as user navigates
        if (success.data.list.length < pageSize) {
          totalPages.value = apiPage; // This is likely the last page
        } else {
          totalPages.value = (currentPage.value + 2).clamp(1, 999); // At least one more
        }

        setLoading(false);
      },
    );
  }

  /// =======================
  /// GETTERS (SAFE)
  /// =======================
  List<TopUser> get topThree => leader.value?.top3 ?? [];

  List<ListUser> get leaderboardUsers => leader.value?.list ?? [];

  Me? get me => leader.value?.me;

  /// =======================
  /// PAGINATION CONTROLS
  /// =======================
  void nextPage() {
    if (currentPage.value < totalPages.value - 1) {
      final nextPageIndex = currentPage.value + 1;
      fetchLeaderboard(page: nextPageIndex + 1); // Convert to 1-based
      currentPage.value = nextPageIndex;
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      final prevPageIndex = currentPage.value - 1;
      fetchLeaderboard(page: prevPageIndex + 1);
      currentPage.value = prevPageIndex;
    }
  }

  /// Direct jump to page (for clickable page numbers)
  void goToPage(int pageIndex) {
    if (pageIndex >= 0 && 
        pageIndex < totalPages.value && 
        pageIndex != currentPage.value) {
      currentPage.value = pageIndex;
      fetchLeaderboard(page: pageIndex + 1); // API uses 1-based
    }
  }
}

// class LeaderboardController extends BaseController {
//   final LeaderboardRepository _leaderRepository;
//   LeaderboardController(this._leaderRepository);

//   final Rx<LeaderboardResponse?> leader = Rx<LeaderboardResponse?>(null);
//   @override
//   void onInit() {
//     super.onInit();
//     // initData();
//   }

//   // Future<void> initData() async {
//   //   await fetchLeaderboard();
//   // }

//   // Pagination
//   final int pageSize = 10;
//   final currentPage = 0.obs;
//   final totalPages = 1.obs;

//   /// =======================
//   /// API CALL
//   /// =======================
//   Future<void> fetchLeaderboard({int page = 1}) async {
//     setLoading(true);

//     final result = await _leaderRepository.getLeaderboard(
//       page: page,
//       limit: pageSize,
//     );
//     DPrint.log(
//       "LeaderboardController fetchLeaderboard from screen call $result",
//     );

//     result.fold(
//       (fail) {
//         setError(fail.message);
//         setLoading(false);
//       },
//       (success) {
//         DPrint.log(
//           "LeaderboardController fetchLeaderboard from screen call ${success.message}",
//         );

//         leader.value = success.data;

//         DPrint.log(
//           "LeaderboardController fetchLeaderboard success ${success.data.me}",
//         );

//         currentPage.value = (success.data.page - 1);
//         totalPages.value = (success.data.list.length / pageSize).ceil().clamp(
//           1,
//           999,
//         );

//         setLoading(false);
//       },
//     );
//   }

//   /// =======================
//   /// GETTERS (SAFE)
//   /// =======================
//   List<TopUser> get topThree => leader.value?.top3 ?? [];

//   List<ListUser> get leaderboardUsers => leader.value?.list ?? [];

//   Me? get me => leader.value?.me;

//   /// =======================
//   /// PAGINATION CONTROLS
//   /// =======================
//   void nextPage() {
//     if (currentPage.value < totalPages.value - 1) {
//       fetchLeaderboard(page: currentPage.value + 2);
//     }
//   }

//   void previousPage() {
//     if (currentPage.value > 0) {
//       fetchLeaderboard(page: currentPage.value);
//     }
//   }
//   void goToPage(int pageIndex) {
//     if (pageIndex >= 0 && 
//         pageIndex < totalPages.value && 
//         pageIndex != currentPage.value) {
//       currentPage.value = pageIndex;
//       fetchLeaderboard(page: pageIndex + 1); // API uses 1-based
//     }
//   }
// }

// class LeaderboardController extends BaseController {
//   final LeaderboardRepository _leaderRepository;

//   final leader = Rx<LeaderboardResponse?>(null);

//   LeaderboardController(this._leaderRepository);

//   // Future<void> fetchLeaderboard() async {
//   //   setLoading(true);

//   //   final result = await _leaderRepository.getLeaderboard();

//   //   result.fold(
//   //     (fail) {
//   //       setError(fail.message);
//   //       setLoading(false);
//   //     },
//   //     (success) {
//   //       leader.value = success.data;
//   //       setLoading(false);
//   //     },
//   //   );
//   // }

//   // Top 3 users (podium section - not paginated)
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
//       email: "you@gtmail.com",
//     ),
//     TopUser(
//       name: "Eiden",
//       score: 75,
//       rank: 3,
//       image: "https://i.pravatar.cc/150?img=13",
//       email: "Eiden@gtmail.com",
//     ),
//   ].obs; // Made observable in case you add refresh later

//   // Full list of users from rank 4 onwards
//   final allLeaderboardUsers = <LeaderboardUser>[
//     LeaderboardUser(rank: 4, name: "Ralph Edwards", score: 70),
//     LeaderboardUser(rank: 5, name: "Cameron Williamson", score: 70),
//     LeaderboardUser(rank: 6, name: "Arlene McCoy", score: 60),
//     LeaderboardUser(rank: 7, name: "Guy Hawkins", score: 60),
//     LeaderboardUser(rank: 8, name: "Annette Black", score: 60),
//     LeaderboardUser(rank: 9, name: "Floyd Miles", score: 60),
//     // Add more users here if you have >9 for testing page 2
//     // LeaderboardUser(rank: 10, name: "Test User 10", score: 55),
//     // LeaderboardUser(rank: 11, name: "Test User 11", score: 50),
//     // ...
//   ].obs;

//   // // Pagination variables
//   final int pageSize = 9; // Exactly 9 items per page
//   var currentPage = 0.obs;
//   var totalPages = 1.obs;

//   // Computed: Users for the current page only
//   List<LeaderboardUser> get currentPageUsers {
//     final start = currentPage.value * pageSize;
//     final end = (start + pageSize).clamp(0, allLeaderboardUsers.length);
//     return allLeaderboardUsers.sublist(start, end);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     _calculateTotalPages();
//   }

//   void _calculateTotalPages() {
//     if (allLeaderboardUsers.isEmpty) {
//       totalPages.value = 1;
//     } else {
//       totalPages.value = (allLeaderboardUsers.length / pageSize).ceil();
//     }
//   }

//   void previousPage() {
//     if (currentPage.value > 0) {
//       currentPage.value--;
//     }
//   }

//   void nextPage() {
//     if (currentPage.value < totalPages.value - 1) {
//       currentPage.value++;
//     }
//   }

//   void goToPage(int page) {
//     if (page >= 0 && page < totalPages.value) {
//       currentPage.value = page;
//     }
//   }

//   // Optional: If you fetch new data later
//   void refreshLeaderboard(List<LeaderboardUser> newUsers) {
//     allLeaderboardUsers.assignAll(newUsers);
//     _calculateTotalPages();
//     currentPage.value = 0; // Reset to first page
//   }

