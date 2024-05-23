import 'package:flutter/material.dart';
import 'package:library_app/routes.dart';
import 'package:library_app/services/prefs.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await storage.init();
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routes().routes,
    );
  }
}
