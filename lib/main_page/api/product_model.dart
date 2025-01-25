class ProductModel {
  int? categoryId;
  String? name;
  int? amount;
  int? userId;
  Null discountStart;
  int? discountPrice;
  int? id;
  int? price;
  String? image;
  int? discount;
  Null discountEnd;
  Category? category;

  ProductModel(
      {this.categoryId,
      this.name,
      this.amount,
      this.userId,
      this.discountStart,
      this.discountPrice,
      this.id,
      this.price,
      this.image,
      this.discount,
      this.discountEnd,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    amount = json['amount'];
    userId = json['user_id'];
    discountStart = json['discount_start'];
    discountPrice = json['discount_price'];
    id = json['id'];
    price = json['price'];
    image = json['image'];
    discount = json['discount'];
    discountEnd = json['discount_end'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['amount'] = amount;
    data['user_id'] = userId;
    data['discount_start'] = discountStart;
    data['discount_price'] = discountPrice;
    data['id'] = id;
    data['price'] = price;
    data['image'] = image;
    data['discount'] = discount;
    data['discount_end'] = discountEnd;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  map(Function(dynamic food) param0) {}
}

class Category {
  int? id;
  String? addedDate;
  String? name;
  String? description;
  String? image;

  Category({this.id, this.addedDate, this.name, this.description, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedDate = json['added_date'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['added_date'] = addedDate;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }

  map(Function(dynamic food) param0) {}
}