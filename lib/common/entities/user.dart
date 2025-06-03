// Login request model
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;
  int? online;

  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
  });

  Map<String, dynamic> toJson() => {
    'type': type,
    'name': name,
    'description': description,
    'email': email,
    'phone': phone,
    'avatar': avatar,
    'open_id': open_id,
    'online': online,
  };
}

// API post response
class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserProfile? data;

  UserLoginResponseEntity(this.code, this.msg, this.data);

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        json['code'],
        json['msg'],
        UserProfile.fromJson(json['data']),
      );
}

// User login result model
class UserProfile {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserProfile({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    // if (json['access_token'] == null) {
    //   return UserProfile();
    // }
    return UserProfile(
      access_token: json['access_token'],
      token: json['token'],
      name: json['Name'],
      description: json['description'],
      avatar: json['avatar'],
      online: json['online'],
      type: json['type'],
    );
  }
  Map<String, dynamic> toJson() => {
    'access_token': access_token,
    'token': token,
    'name': name,
    'description': description,
    'avatar': avatar,
    'online': online,
    'type': type,
  };
}

// Firestore user model
class UserData {
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;

  UserData(this.token, this.name, this.description, this.avatar, this.online);

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
      data?['token'],
      data?['name'],
      data?['description'],
      data?['avatar'],
      data?['online'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'description': description,
    'avatar': avatar,
    'online': online,
  };
}
