class UserModel {
  int? id;
  String? name;
  String? password;
  String? token;
  String? email;
  String? username;
  String? role;
  String? image;
  String? address;
  int? phonenumber;

  UserModel(
      {this.id,
      this.name,
      this.password,
      this.token,
      this.email,
      this.username,
      this.role,
      this.image,
      this.phonenumber,
      this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    token = json['token'];
    email = json['email'];
    username = json['username'];
    role = json['role'];
    image = json['image'];
    address = json['address'];
    phonenumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['password'] = password;
    data['token'] = token;
    data['email'] = email;
    data['username'] = username;
    data['role'] = role;
    data['image'] = image;
    data['address'] = address;
    data['phone_number'] = phonenumber;
    return data;
  }
}
