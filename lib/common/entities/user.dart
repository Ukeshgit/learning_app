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
  UserItem? data;

  UserLoginResponseEntity(this.code, this.msg, this.data);

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        json['code'],
        json['msg'],
        UserItem.fromJson(json['data']),
      );
}

// User login result model
class UserItem {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserItem(
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  );

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
    json['access_token'],
    json['token'],
    json['name'],
    json['description'],
    json['avatar'],
    json['online'],
    json['type'],
  );

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
