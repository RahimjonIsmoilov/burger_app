class OrderModel {
  int? ordercount = 0;
  bool liked;
  final String imgpath;
  final String name;
  final String description;
  final String price;
  final String weight;
  OrderModel({
    required this.imgpath,
    required this.name,
    required this.description,
    required this.price,
    required this.weight,
    this.ordercount,
    this.liked = false,
  });
}
