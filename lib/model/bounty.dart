import 'dart:convert';

import 'package:flutter/foundation.dart';

class Bounty {
  String id;
  String title;
  String description;
  String deadline;
  String rewards;
  List<String> tags;
  String walletAddress;

  Bounty({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.rewards,
    required this.tags,
    required this.walletAddress,
  });

  Bounty copyWith({
    String? id,
    String? title,
    String? description,
    String? deadline,
    String? rewards,
    List<String>? tags,
    String? walletAddress,
  }) {
    return Bounty(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      rewards: rewards ?? this.rewards,
      tags: tags ?? this.tags,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'rewards': rewards,
      'tags': tags,
      'walletAddress': walletAddress,
    };
  }

  factory Bounty.fromMap(Map<String, dynamic> map) {
    return Bounty(
      id: map['_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      deadline: map['deadline'] as String,
      rewards: map['rewards'] as String,
      tags: List<String>.from(map['tags'] as List<dynamic>),
      walletAddress: map['walletAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bounty.fromJson(String source) => Bounty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bounty(_id: $id, title: $title, description: $description, deadline: $deadline, rewards: $rewards, tags: $tags, walletAddress: $walletAddress)';
  }

  @override
  bool operator ==(covariant Bounty other) {
    if (identical(this, other)) return true;

    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.deadline == deadline &&
      other.rewards == rewards &&
      listEquals(other.tags, tags) &&
      other.walletAddress == walletAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      deadline.hashCode ^
      rewards.hashCode ^
      tags.hashCode ^
      walletAddress.hashCode;
  }
}
