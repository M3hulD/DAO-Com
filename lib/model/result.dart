// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Result {
  String id;
  String name;
  String department;
  String email;
  String walletAddress;
  String orgId;
  Result({
    required this.id,
    required this.name,
    required this.department,
    required this.email,
    required this.walletAddress,
    required this.orgId,
  });

  Result copyWith({
    String? id,
    String? name,
    String? department,
    String? email,
    String? walletAddress,
    String? orgId,
  }) {
    return Result(
      id: id ?? this.id,
      name: name ?? this.name,
      department: department ?? this.department,
      email: email ?? this.email,
      walletAddress: walletAddress ?? this.walletAddress,
      orgId: orgId ?? this.orgId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'department': department,
      'email': email,
      'walletAddress': walletAddress,
      'orgId': orgId,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['_id'] as String,
      name: map['name'] as String,
      department: map['department'] as String,
      email: map['email'] as String,
      walletAddress: map['walletAddress'] as String,
      orgId: map['orgId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Result(_id: $id, name: $name, department: $department, email: $email, walletAddress: $walletAddress, orgId: $orgId)';
  }

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.department == department &&
      other.email == email &&
      other.walletAddress == walletAddress &&
      other.orgId == orgId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      department.hashCode ^
      email.hashCode ^
      walletAddress.hashCode ^
      orgId.hashCode;
  }
}
