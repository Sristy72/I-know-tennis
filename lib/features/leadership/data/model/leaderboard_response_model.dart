// leaderboard_response.dart

import 'package:flutter_iknow_tennis/core/utils/debug_print.dart';

class LeaderboardResponse {
  final int page;
  final int limit;
  final List<TopUser> top3;
  final List<ListUser> list;
  final Me me;

  LeaderboardResponse({
    required this.page,
    required this.limit,
    required this.top3,
    required this.list,
    required this.me,
  });

  factory LeaderboardResponse.fromJson(Map<String, dynamic> json) {
  DPrint.log("LeaderboardResponse in fromJson: $json");
  return LeaderboardResponse(
    page: json['page'],
    limit: json['limit'],
    top3: (json['top3'] as List).map((e) => TopUser.fromJson(e)).toList(),
    list: (json['list'] as List).map((e) => ListUser.fromJson(e)).toList(),
    me: Me.fromJson(json['me']),
  );
}


  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'top3': top3.map((e) => e.toJson()).toList(),
      'list': list.map((e) => e.toJson()).toList(),
      'me': me.toJson(),
    };
  }
}

class TopUser {
  final int rank;
  final String userId;
  final String? fullName;
  final String? avatar;
  final int points;

  TopUser({
    required this.rank,
    required this.userId,
    required this.fullName,
    this.avatar,
    required this.points,
  });

  factory TopUser.fromJson(Map<String, dynamic> json) {
    return TopUser(
      rank: json['rank'],
      userId: json['userId'],
      fullName: json['fullName'],
      avatar: json['avatar'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'userId': userId,
      'fullName': fullName,
      'avatar': avatar,
      'points': points,
    };
  }
}

class ListUser {
  final int rank;
  final String userId;
  final String? fullName;
  final String? email;          // ← fix 1: nullable
  final String? avatar;
  final String? role;           // ← fix 2: nullable
  final int points;

  ListUser({
    required this.rank,
    required this.userId,
    this.fullName,              // ← no longer required
    this.email,                 // ← no longer required
    this.avatar,
    this.role,                  // ← no longer required
    required this.points,
  });

  factory ListUser.fromJson(Map<String, dynamic> json) {
    return ListUser(
      rank: json['rank'] as int,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      role: json['role'] as String?,
      points: json['points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'avatar': avatar,
      'role': role,
      'points': points,
    };
  }
}

class Me {
  final String userId;
  final int? rank;
  final int points;

  Me({required this.userId, this.rank, required this.points});

  factory Me.fromJson(Map<String, dynamic> json) {
    return Me(
      userId: json['userId'],
      rank: json['rank'], // can be null
      points: json['points'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'rank': rank, 'points': points};
  }
}
