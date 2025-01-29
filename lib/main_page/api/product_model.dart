class ProductModel {
  int? id;
  String? description;
  String? imgpath;
  String? name;
  String? price;
  String? weight;
  String? category;
  int? ordercount;
  bool? liked;

  ProductModel(
      {this.id,
      this.description,
      this.imgpath,
      this.name,
      this.price,
      this.weight,
      this.category,
      this.ordercount,
      this.liked});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    imgpath = json['imgpath'];
    name = json['name'];
    price = json['price'];
    weight = json['weight'];
    category = json['category'];
    ordercount = json['ordercount'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['imgpath'] = imgpath;
    data['name'] = name;
    data['price'] = price;
    data['weight'] = weight;
    data['category'] = category;
    data['ordercount'] = ordercount;
    data['liked'] = liked;
    return data;
  }
}