import 'package:burger_app/main_page/bloc/food_bloc.dart';
import 'package:burger_app/main_page/widgets/foodcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Foods extends StatefulWidget {
  const Foods({super.key, this.categor = "Hammasi"});

  final String categor;

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  void initState() {
    BlocProvider.of<FoodBloc>(context).add(FoodLoadingData());
    super.initState();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.categor == "Hammasi") {
  //     setState(() {
  //       categoryfood = foods;
  //     });
  //   }
  // }

  // @override
  // void didUpdateWidget(covariant Foods oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.categor != widget.categor) {
  //     setState(() {
  //       categoryfood =
  //           foods.where((food) => food.category == widget.categor).toList();
  //     });
  //   }
  //   if (widget.categor == "Hammasi") {
  //     setState(() {
  //       categoryfood = foods;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount =
            (MediaQuery.of(context).size.width > 600 ? 3 : 2).floor();

        return BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodSucces) {
              return GridView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: state.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.77,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return FoodCard(
                    productmodel: state.productList[index],
                    index: index,
                  );
                },
              );
            }
            if (state is FoodError) {
              return const Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 160,
                    ),
                    Text(
                      "Xatolik !!!",
                      style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.77,
              ),
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 220, width: 160, child: Card());
              },
            );
          },
        );
      },
    );
  }
}
