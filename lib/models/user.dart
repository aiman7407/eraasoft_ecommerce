class UserHub {
  int? status;
  String? message;
  Data? data;

  UserHub({this.status, this.message, this.data});

  UserHub.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Profile? profile;

  Data({this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? name;
  String? email;
  String? address;
  String? phone;
  String? image='';
  Null? emailVerified;

  Profile(
      {this.name,
        this.email,
        this.address,
        this.phone,
        this.image,
        this.emailVerified});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    emailVerified = json['email verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email verified'] = this.emailVerified;
    return data;
  }
}