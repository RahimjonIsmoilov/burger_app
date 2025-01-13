class Fooddmodel {
  int ordercount;
  bool liked;
  final String imgpath;
  final String name;
  final String description;
  final String price;
  final String category;
  final String weight;
  Fooddmodel({
    required this.imgpath,
    required this.name,
    required this.description,
    required this.price,
    required this.weight,
    required this.category,
    this.ordercount = 0,
    this.liked = false,
  });
}
