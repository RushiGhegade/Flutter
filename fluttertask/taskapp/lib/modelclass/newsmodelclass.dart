import 'dart:convert';

class Event {
  final String id;
  final User user;
  final String description;
  final String title;
  final List<String> images;
  final List<String> likedUsers;
  final List<String> comments;
  final List<String> eventCategory;
  final DateTime eventStartAt;
  final DateTime eventEndAt;
  final bool registrationRequired;
  final List<String> keywords;
  final List<String> hashTags;
  final List<String> registration;
  final int likes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Event({
    required this.id,
    required this.user,
    required this.description,
    required this.title,
    required this.images,
    required this.likedUsers,
    required this.comments,
    required this.eventCategory,
    required this.eventStartAt,
    required this.eventEndAt,
    required this.registrationRequired,
    required this.keywords,
    required this.hashTags,
    required this.registration,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      user: User.fromJson(json['user']),
      description: json['description'],
      title: json['title'],
      images: List<String>.from(json['images']),
      likedUsers: List<String>.from(json['likedUsers']),
      comments: List<String>.from(json['comments']),
      eventCategory: List<String>.from(json['eventCategory']),
      eventStartAt: DateTime.parse(json['eventStartAt']),
      eventEndAt: DateTime.parse(json['eventEndAt']),
      registrationRequired: json['registrationRequired'],
      keywords: List<String>.from(json['keywords']),
      hashTags: List<String>.from(json['hashTags']),
      registration: List<String>.from(json['registration']),
      likes: json['likes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final bool isVerified;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      isVerified: json['isVerified'],
    );
  }
}
