import 'package:flutter/material.dart';
import 'fullrecipe.dart';
import 'homeScreen.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.network(
                recipe.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Text(
                recipe.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.soup_kitchen_rounded),
                    title: Text(
                      recipe.sourceName,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.people_alt_rounded),
                    title: Text(
                      recipe.servings.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

// List Tile

            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                'Ingredients:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: recipe.extendedIngredients.map((ingredient) {
                  return Chip(
                    label: Text(ingredient.name),
                    elevation: 3.0,
                    shadowColor: const Color.fromARGB(255, 63, 63, 72),
                    backgroundColor: const Color.fromARGB(255, 255, 253, 87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Customize the radius as needed
                    ),
                  );
                }).toList(),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullrecipeScreen(
                          url: recipe.sourceUrl,
                        ),
                      ),
                    ),
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 63, 63, 72)),
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.fromLTRB(115.0, 20.0, 115.0, 20.0)),
                  ),
                  child: const Text(
                    "view full recipe",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
