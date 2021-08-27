import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/models/cart_models.dart';
import 'package:foodapp/models/categories_model.dart';
import 'package:foodapp/models/food_categories_models.dart';
import 'package:foodapp/models/food_models.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModel> allList = [];
  late CategoriesModel allModel;

  Future<void> getAllCategory() async {
    List<CategoriesModel> newAllList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("tSt3pdLrA6gIRbkRQdSy")
        .collection("All")
        .get();
    querySnapshot.docs.forEach((element) {
      allModel = CategoriesModel(
        image: element['image'],
        name: element["name"],
      );
      print(allModel.name);
      newAllList.add(allModel);
      allList = newAllList;
    });
    notifyListeners();
  }

  get thorowAllList {
    return allList;
  }

  // category 1- Burger
  List<CategoriesModel> burgerList = [];
  late CategoriesModel burgerModel;

  Future<void> getBurgerCategory() async {
    List<CategoriesModel> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("tSt3pdLrA6gIRbkRQdSy")
        .collection("Burger")
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModel = CategoriesModel(
        image: element['image'],
        name: element["name"],
      );
      print(burgerModel.name);
      newBurgerList.add(burgerModel);
      burgerList = newBurgerList;
    });
    notifyListeners();
  }

  get thorowBurgerList {
    return burgerList;
  }

  // category 2- Recipe

  List<CategoriesModel> recipeList = [];
  late CategoriesModel recipeModel;
  Future<void> getRecipeCategory() async {
    List<CategoriesModel> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("tSt3pdLrA6gIRbkRQdSy")
        .collection("Recipe")
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModel = CategoriesModel(
        image: element['image'],
        name: element["name"],
      );
      print(recipeModel.name);
      newRecipeList.add(recipeModel);
      recipeList = newRecipeList;
    });
    notifyListeners();
  }

  get thorowRecipeList {
    return recipeList;
  }

  // category 3- Pizza

  List<CategoriesModel> pizzaList = [];
  late CategoriesModel pizzaModel;
  Future<void> getPizzaCategory() async {
    List<CategoriesModel> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("tSt3pdLrA6gIRbkRQdSy")
        .collection("Pizza")
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModel = CategoriesModel(
        image: element['image'],
        name: element["name"],
      );
      print(pizzaModel.name);
      newPizzaList.add(pizzaModel);
      pizzaList = newPizzaList;
    });
    notifyListeners();
  }

  get thorowPizzaList {
    return pizzaList;
  }

  // category 4- Drink

  List<CategoriesModel> drinkList = [];
  late CategoriesModel drinkModel;
  Future<void> getDrinkCategory() async {
    List<CategoriesModel> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("tSt3pdLrA6gIRbkRQdSy")
        .collection("Drink")
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModel = CategoriesModel(
        image: element['image'],
        name: element["name"],
      );
      print(drinkModel.name);
      newDrinkList.add(drinkModel);
      drinkList = newDrinkList;
    });
    notifyListeners();
  }

  get thorowDrinkList {
    return drinkList;
  }

  //----------------   Single Food ITem --------------

  // Food Model List
  List<FoodModel> foodModelList = [];
  late FoodModel foodModel;

  Future<void> getFoodList() async {
    List<FoodModel> newFoodModelList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Foods").get();
    querySnapshot.docs.forEach((element) {
      foodModel = FoodModel(
        image: element["image"],
        name: element["name"],
        price: element["price"],
      );
      newFoodModelList.add(foodModel);
      print(foodModel.name);
    });
    foodModelList = newFoodModelList;
    notifyListeners();
  }

  get throwFoodModelList {
    return foodModelList;
  }

  /////////////////// burger categories----------

  List<FoodCategoriesModels> burgerCategoriesList = [];
  FoodCategoriesModels? burgerCategoriesModel;

  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModels> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('7LdhKKbcVCiqeoBZA1Fr')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModel = FoodCategoriesModels(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModel!);
      print(burgerCategoriesModel!.name);
    });
    burgerCategoriesList = newBurgerCategoriesList;
    notifyListeners();
  }

  get thorowBurgerCategoriesList {
    return burgerCategoriesList;
  }

  /////////////////// recipe categories----------

  List<FoodCategoriesModels> recipeCategoriesList = [];
  FoodCategoriesModels? recipeCategoriesModel;

  Future<void> getRecipeCategoriesList() async {
    List<FoodCategoriesModels> newRecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('7LdhKKbcVCiqeoBZA1Fr')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModel = FoodCategoriesModels(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newRecipeCategoriesList.add(recipeCategoriesModel!);
      print(burgerCategoriesModel!.name);
    });
    recipeCategoriesList = newRecipeCategoriesList;
    notifyListeners();
  }

  get thorowRecipeCategoriesList {
    return recipeCategoriesList;
  }

  /////////////////// Pizza categories----------

  List<FoodCategoriesModels> pizzaCategoriesList = [];
  FoodCategoriesModels? pizzaCategoriesModel;

  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModels> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('7LdhKKbcVCiqeoBZA1Fr')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModel = FoodCategoriesModels(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModel!);
      print(pizzaCategoriesModel!.name);
    });
    pizzaCategoriesList = newPizzaCategoriesList;
    notifyListeners();
  }

  get thorowPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  /////////////////// Pizza categories----------

  List<FoodCategoriesModels> drinkCategoriesList = [];
  FoodCategoriesModels? drinkCategoriesModel;

  Future<void> getDrinkCategoriesList() async {
    List<FoodCategoriesModels> newDrinkCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('7LdhKKbcVCiqeoBZA1Fr')
        .collection('drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkCategoriesModel = FoodCategoriesModels(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      newDrinkCategoriesList.add(drinkCategoriesModel!);
      print(pizzaCategoriesModel!.name);
    });
    drinkCategoriesList = newDrinkCategoriesList;
    notifyListeners();
  }

  get thorowDrinkCategoriesList {
    return drinkCategoriesList;
  }

  /////////////// add to cart /////////////////

  List<CartModel> cartList = [];
  List<CartModel> newCartList = [];
  CartModel? cartModel;
  void addToCart(
      {required String image,
      required String name,
      required int price,
      required int quantity}) {
    cartModel =
        CartModel(image: image, name: name, price: price, quantity: quantity);
    newCartList.add(cartModel!);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalPrice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  int? deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex!);
    notifyListeners();
  }
}
