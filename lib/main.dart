import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';
import 'screens/splashscreen.dart';
import 'screens/fullrecipe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Recipe? recipe;
  const MyApp({Key? key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => WillPopScope(
              onWillPop: () async {
                // Implement logic to handle back button press on home screen
                return await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('The Chef'),
                    content:
                        const Text('Are you sure you want to exit The Chef?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(
                            context, false), // Stay on home screen
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(context, true), // Exit app
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              child: HomeScreen(), // Wrap HomeScreen with WillPopScope
            ),
        '/fullrecipe': (context) => FullrecipeScreen(url: recipe!.sourceUrl),
      },
    );
  }
}
