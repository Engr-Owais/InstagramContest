class Owner {
  String id;
  bool isVerified;
  String profilePicUrl;
  String username;

  Owner({this.id, this.isVerified, this.profilePicUrl, this.username});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isVerified = json['is_verified'];
    profilePicUrl = json['profile_pic_url'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_verified'] = this.isVerified;
    data['profile_pic_url'] = this.profilePicUrl;
    data['username'] = this.username;
    return data;
  }
}
