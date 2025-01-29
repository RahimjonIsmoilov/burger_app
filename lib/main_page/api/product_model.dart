class ProductModel {
  String? category;
  String? name;
  String? description;
  String? bigImage;
  int? discount;
  String? discountEnd;
  double? averageRating;
  int? kcal;
  int? price;
  int? id;
  String? smallImage;
  int? userId;
  String? discountStart;
  int? discountPrice;
  int? ratingCount;
  int? weight;
  Creator? creator;

  ProductModel(
      {this.category,
      this.name,
      this.description,
      this.bigImage,
      this.discount,
      this.discountEnd,
      this.averageRating,
      this.kcal,
      this.price,
      this.id,
      this.smallImage,
      this.userId,
      this.discountStart,
      this.discountPrice,
      this.ratingCount,
      this.weight,
      this.creator});

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    name = json['name'];
    description = json['description'];
    bigImage = json['big_image'];
    discount = json['discount'];
    discountEnd = json['discount_end'];
    averageRating = json['average_rating'];
    kcal = json['kcal'];
    price = json['price'];
    id = json['id'];
    smallImage = json['small_image'];
    userId = json['user_id'];
    discountStart = json['discount_start'];
    discountPrice = json['discount_price'];
    ratingCount = json['rating_count'];
    weight = json['weight'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['name'] = this.name;
    data['description'] = this.description;
    data['big_image'] = this.bigImage;
    data['discount'] = this.discount;
    data['discount_end'] = this.discountEnd;
    data['average_rating'] = this.averageRating;
    data['kcal'] = this.kcal;
    data['price'] = this.price;
    data['id'] = this.id;
    data['small_image'] = this.smallImage;
    data['user_id'] = this.userId;
    data['discount_start'] = this.discountStart;
    data['discount_price'] = this.discountPrice;
    data['rating_count'] = this.ratingCount;
    data['weight'] = this.weight;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    return data;
  }
}

class Creator {
  String? password;
  String? name;
  int? id;
  String? token;
  String? address;
  String? email;
  String? role;
  String? image;

  Creator(
      {this.password,
      this.name,
      this.id,
      this.token,
      this.address,
      this.email,
      this.role,
      this.image});

  Creator.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    name = json['name'];
    id = json['id'];
    token = json['token'];
    address = json['address'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['name'] = this.name;
    data['id'] = this.id;
    data['token'] = this.token;
    data['address'] = this.address;
    data['email'] = this.email;
    data['role'] = this.role;
    data['image'] = this.image;
    return data;
  }
}
