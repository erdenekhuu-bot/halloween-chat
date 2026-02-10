import 'package:halloween/model/ProfileModel.dart';

class MembersModel {
  final int id;
  final String username;
  final String email;
  final ProfileModel? profile;

  const MembersModel({required this.id, required this.username, required this.email,this.profile,});

  factory MembersModel.fromJson(Map<String, dynamic> json) {
    return MembersModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profile: json['profile'] != null
          ? ProfileModel.fromJson(json['profile'])
          : null,
    );
  }
}