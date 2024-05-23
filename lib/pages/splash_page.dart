import 'package:flutter/material.dart';
import 'package:library_app/providers/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      builder: (context, child) => const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen({super.key});

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SplashProvider>();
    if (!provider.isLoaded) provider.load(context);
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/library.png'),
            Text(
              'Library Database App',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ).animate(effects: [
          const FadeEffect(
            duration: Duration(seconds: 3),
          curve: Curves.easeOut,
          )
        ]),
      ),
    );
  }
}
