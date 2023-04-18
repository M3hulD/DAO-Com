// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class Grants {
  String id;
  String title;
  String description;
  String deadline;
  String amount;
  String walletAddress;
  Grants({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.amount,
    required this.walletAddress,
  });

  Grants copyWith({
    String? id,
    String? title,
    String? description,
    String? deadline,
    String? amount,
    String? walletAddress,
  }) {
    return Grants(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      amount: amount ?? this.amount,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'description': description,
      'deadline': deadline,
      'amount': amount,
      'walletAddress': walletAddress,
    };
  }

  factory Grants.fromMap(Map<String, dynamic> map) {
    return Grants(
      id: map['_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      deadline: map['deadline'] as String,
      amount: map['amount'] as String,
      walletAddress: map['walletAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Grants.fromJson(String source) => Grants.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Grants(_id: $id, title: $title, description: $description, deadline: $deadline, amount: $amount, walletAddress: $walletAddress)';
  }

  @override
  bool operator ==(covariant Grants other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.deadline == deadline &&
      other.amount == amount &&
      other.walletAddress == walletAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      deadline.hashCode ^
      amount.hashCode ^
      walletAddress.hashCode;
  }
}
