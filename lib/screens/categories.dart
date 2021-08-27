import 'package:flutter/material.dart';
import 'package:foodapp/models/food_categories_models.dart';
import 'package:foodapp/screens/detail_page.dart';
import 'package:foodapp/widgets/bottom_container.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  List<FoodCategoriesModels> list = [];
  Categories({required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3a3e3e),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: list
              .map(
                (e) => BottomContainer(
                  textColor: Colors.white,
                  imageSrc: e.image,
                  price: e.price,
                  name: e.name,
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          image: e.image,
                          price: e.price,
                          name: e.name,
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
