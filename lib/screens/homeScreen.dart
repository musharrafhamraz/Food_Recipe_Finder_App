import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<HomeScreen> {
  late Future<List<Recipe>> futureRecipes;

  @override
  void initState() {
    super.initState();
    futureRecipes = fetchRecipes();
  }

  Future<void> _refreshRecipes() async {
    setState(() {
      futureRecipes = fetchRecipes();
    });
  }

  dynamic showModal(context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Filter will be applied here.'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 41, 41, 48),
      body: RefreshIndicator(
        onRefresh: _refreshRecipes,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 38.0, 10.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Search more recipes',
                          filled: true,
                          fillColor: const Color.fromARGB(255, 63, 63, 72),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      height: 56.0,
                      width: 56.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 63, 63, 72),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: IconButton(
                        onPressed: () => showModal(context),
                        icon: const Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Expanded(
                  child: FutureBuilder<List<Recipe>>(
                    future: futureRecipes,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return AlertDialog(
                          title: const Icon(Icons.error_rounded),
                          content: const Text("We ran into an error"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _refreshRecipes(); // Call the function here
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        List<Recipe> recipes = snapshot.data!;
                        return ListView.builder(
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            Recipe recipe = recipes[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(recipe: recipe),
                                  ),
                                );
                              },
                              child: Container(
                                height: 190.0,
                                width: 330.0,
                                margin: const EdgeInsets.only(
                                    right: 10.0, bottom: 20.0, left: 10.0),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 20.0,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 63, 63, 72),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recipe.title,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '${recipe.readyInMinutes} min',
                                            style: const TextStyle(
                                                color: Colors.white70),
                                          ),
                                          Text(
                                            '${recipe.extendedIngredients.length} ingredients',
                                            style: const TextStyle(
                                                color: Colors.white70),
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              minimumSize:
                                                  WidgetStateProperty.all(
                                                const Size(130.0, 30.0),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              'Full of protein',
                                              style: TextStyle(fontSize: 9.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150.0,
                                      height: 150.0,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(70.0),
                                        ),
                                        child: Image.network(
                                          recipe.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text('No recipes available');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Recipe>> fetchRecipes() async {
  const String apiKey = '1dc4573b897d4463bcf6554b2ad2ab4e';
  const String apiUrl =
      'https://api.spoonacular.com/recipes/random?number=10&apiKey=$apiKey';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List<dynamic> recipesJson = jsonResponse['recipes'];
    return recipesJson.map((json) => Recipe.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load recipes');
  }
}

class Recipe {
  final int id;
  final String title;
  final String image;
  final int servings;
  final int readyInMinutes;
  final String sourceName;
  final String sourceUrl;
  final List<ExtendedIngredient> extendedIngredients;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.servings,
    required this.readyInMinutes,
    required this.sourceName,
    required this.sourceUrl,
    required this.extendedIngredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var list = json['extendedIngredients'] as List;
    List<ExtendedIngredient> ingredientsList =
        list.map((i) => ExtendedIngredient.fromJson(i)).toList();

    return Recipe(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      servings: json['servings'],
      readyInMinutes: json['readyInMinutes'],
      sourceName: json['sourceName'],
      sourceUrl: json['sourceUrl'],
      extendedIngredients: ingredientsList,
    );
  }
}

class ExtendedIngredient {
  final String name;
  final double amount;
  final String unit;

  ExtendedIngredient({
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredient(
      name: json['name'],
      amount: json['amount'].toDouble(),
      unit: json['unit'],
    );
  }
}
