// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Job{
  String id;
  String title;
  String description;
  String department;
  String location;
  String type;
  String walletAddress;
  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.department,
    required this.location,
    required this.type,
    required this.walletAddress,
  });

  Job copyWith({
    String? id,
    String? title,
    String? description,
    String? department,
    String? location,
    String? type,
    String? walletAddress,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      department: department ?? this.department,
      location: location ?? this.location,
      type: type ?? this.type,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'description': description,
      'department': department,
      'location': location,
      'type': type,
      'walletAddress': walletAddress,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      department: map['department'] as String,
      location: map['location'] as String,
      type: map['type'] as String,
      walletAddress: map['walletAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job(_id: $id, title: $title, description: $description, department: $department, location: $location, type: $type, walletAddress: $walletAddress)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.department == department &&
      other.location == location &&
      other.type == type&&
      other.walletAddress == walletAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      department.hashCode ^
      location.hashCode ^
      type.hashCode ^
      walletAddress.hashCode;
  }
}
