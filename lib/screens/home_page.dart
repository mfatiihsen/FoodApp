import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/models/categories_model.dart';
import 'package:foodapp/models/food_categories_models.dart';
import 'package:foodapp/models/food_models.dart';
import 'package:foodapp/provider/my_provider.dart';
import 'package:foodapp/screens/cart_page.dart';
import 'package:foodapp/screens/categories.dart';
import 'package:foodapp/screens/detail_page.dart';
import 'package:foodapp/screens/welcpme_page.dart';
import 'package:foodapp/size_config.dart';
import 'package:foodapp/widgets/bottom_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoriesModel> allList = [];
  List<CategoriesModel> burgerList = [];
  List<CategoriesModel> recipeList = [];
  List<CategoriesModel> pizzaList = [];
  List<CategoriesModel> drinkList = [];

  List<FoodModel> singleFoodList = [];

  List<FoodCategoriesModels> burgerCategoriesList = [];
  List<FoodCategoriesModels> recipeCategoriesList = [];
  List<FoodCategoriesModels> pizzaCategoriesList = [];
  List<FoodCategoriesModels> drinkCategoriesList = [];

  Widget categoriesContainer(
      {required String image,
      required String name,
      required VoidCallback press}) {
    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  Widget all() {
    return Row(
      children: allList
          .map(
            (e) =>
                categoriesContainer(image: e.image, name: e.name, press: () {}),
          )
          .toList(),
    );
  }

  Widget burger() {
    return Row(
      children: burgerList
          .map(
            (e) => categoriesContainer(
                image: e.image,
                name: e.name,
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: burgerCategoriesList),
                    ),
                  );
                }),
          )
          .toList(),
    );
  }

  Widget recipe() {
    return Row(
      children: recipeList
          .map(
            (e) => categoriesContainer(
                image: e.image,
                name: e.name,
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: recipeCategoriesList),
                    ),
                  );
                }),
          )
          .toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzaList
          .map(
            (e) => categoriesContainer(
                image: e.image,
                name: e.name,
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: pizzaCategoriesList),
                    ),
                  );
                }),
          )
          .toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinkList
          .map(
            (e) => categoriesContainer(
                image: e.image,
                name: e.name,
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Categories(
                        list: drinkCategoriesList,
                      ),
                    ),
                  );
                }),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    // all category
    provider.getAllCategory();
    allList = provider.thorowAllList;
    //category 2 burger
    provider.getBurgerCategory();
    burgerList = provider.thorowBurgerList;
    // category recipe
    provider.getRecipeCategory();
    recipeList = provider.thorowRecipeList;
    // category pizza
    provider.getPizzaCategory();
    pizzaList = provider.thorowPizzaList;
    // category drink.

    provider.getDrinkCategory();
    drinkList = provider.thorowDrinkList;

    // single food list
    provider.getFoodList();
    singleFoodList = provider.throwFoodModelList;

    // categories burger
    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.thorowBurgerCategoriesList;

    // categories recipe
    provider.getRecipeCategoriesList();
    recipeCategoriesList = provider.thorowRecipeCategoriesList;

    // categories pizza
    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.thorowPizzaCategoriesList;

    // categories drink
    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.thorowDrinkCategoriesList;

    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ana Sayfa",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart,
                    color: Color(0xff2b2b2b), size: 25),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  all(),
                  burger(),
                  recipe(),
                  pizza(),
                  drink(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: singleFoodList
                        .map(
                          (e) => BottomContainer(
                            imageSrc: e.image,
                            textColor: Colors.white,
                            price: e.price,
                            name: e.name,
                            press: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    image: e.image,
                                    name: e.name,
                                    price: e.price,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff2b2b2b),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/background.jpg"),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                accountName: Text("Fatih ŞEN"),
                accountEmail: Text("Ademfatih37@gmail.com"),
              ),
              DrawerMenuItem(
                text: "Profile",
                iconColor: Colors.white,
                textColor: Colors.white,
                icon: Icons.person,
                press: () {},
              ),
              DrawerMenuItem(
                text: "Cart",
                iconColor: Colors.white,
                textColor: Colors.white,
                icon: Icons.add_shopping_cart,
                press: () {},
              ),
              DrawerMenuItem(
                text: "Order",
                iconColor: Colors.white,
                textColor: Colors.white,
                icon: Icons.shop,
                press: () {},
              ),
              DrawerMenuItem(
                text: "About",
                iconColor: Colors.white,
                textColor: Colors.white,
                icon: Icons.info,
                press: () {},
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
              ),
              ListTile(
                leading: Text(
                  "Comunicate",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              DrawerMenuItem(
                text: "Change",
                iconColor: Colors.white,
                textColor: Colors.white,
                icon: Icons.lock,
                press: () {},
              ),
              DrawerMenuItem(
                text: "Log Out",
                iconColor: Colors.white,
                textColor: Colors.white,
                icon: Icons.login_outlined,
                press: () {
                  signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    Key? key,
    required this.text,
    required this.iconColor,
    required this.textColor,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18),
      ),
      onTap: press,
    );
  }
}

void signOut() async {
  await FirebaseAuth.instance.signOut();
}
