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

  UserModel(
      {this.id,
      this.name,
      this.password,
      this.token,
      this.email,
      this.username,
      this.role,
      this.image,
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['password'] = this.password;
    data['token'] = this.token;
    data['email'] = this.email;
    data['username'] = this.username;
    data['role'] = this.role;
    data['image'] = this.image;
    data['address'] = this.address;
    return data;
  }
}
