import 'package:burger_app/main_page/models/fooddmodel.dart';

List<Fooddmodel> foods = [
  Fooddmodel(
      description:
          "Котлета куриная, свежие овощи, сыр чеддер, соус для бургера",
      imgpath: "images/Chicken burger 2.png",
      name: "Чикен Бургер",
      price: "16000",
      weight: "300",
      category: 'HotDog',
      ordercount: 0,
      liked: true),
  Fooddmodel(
      imgpath: "images/pitsa.png",
      name: "Деревенская",
      description:
          "Тесто, пицца соус, грудкаптицы в/к, морковь покорейски, сыр моцарелла",
      price: "16000",
      weight: "300",
      ordercount: 0,
      category: 'Pitsa',
      liked: true),
  Fooddmodel(
      description:
          "Горячая вода проходит путь под давлением через фильтр с молотым кофе",
      imgpath: "images/coffe.png",
      name: "Кофе эспрессо",
      price: "4000",
      weight: "50",
      ordercount: 0,
      category: 'drink'),
  Fooddmodel(
      imgpath: "images/lavash.png",
      name: "В беконе",
      description: "Французский багет, соус,сосиска в беконе",
      price: "12000",
      weight: "150",
      category: 'lavash',
      ordercount: 2),
  Fooddmodel(
    description: "Котлета куриная, свежие овощи, сыр чеддер, соус для бургера",
    imgpath: "images/free.png",
    name: "Картофель Фри",
    price: "8000",
    weight: "150",
    category: 'free',
    ordercount: 1,
  ),
  Fooddmodel(
      imgpath: "images/Blackburger.png",
      name: "Блэк Бургер",
      description:
          "Котлета свино-говяжья,свежие овощи, сыр чеддер,соус для бургера",
      price: "190",
      weight: "330",
      ordercount: 0,
      category: 'HotDog')
];
