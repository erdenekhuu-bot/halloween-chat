class ProfileModel {
  final int? user;
  final String? image;

  const ProfileModel({this.user, this.image});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      user: json['user'],
      image: json['image'],
    );
  }
}
