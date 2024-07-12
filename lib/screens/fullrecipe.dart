import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class FullrecipeScreen extends StatefulWidget {
//   final String url; // Define the required 'url' parameter

//   const FullrecipeScreen({super.key, required this.url});

//   @override
//   State<FullrecipeScreen> createState() => _FullRecipeScreenState();
// }

// class _FullRecipeScreenState extends State<FullrecipeScreen> {
//   final _controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.disabled)
//     ..loadRequest(uri: Uri.parse());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Full Recipe"),
//       ),
//       body: WebViewWidget(
//         controller: _controller,
//       ),
//     );
//   }
// }

class FullrecipeScreen extends StatefulWidget {
  final String url; // Define the required 'url' parameter

  const FullrecipeScreen({super.key, required this.url});

  @override
  State<FullrecipeScreen> createState() => _FullRecipeScreenState();
}

class _FullRecipeScreenState extends State<FullrecipeScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Recipe"),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
