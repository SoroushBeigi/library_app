import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart' hide LoginProvider;
import 'package:go_router/go_router.dart';
import 'package:library_app/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      builder: (context, child) => const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  const _LoginScreen({super.key});

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return FlutterLogin(
      logo: const AssetImage('assets/library.png'),
      theme: LoginTheme(
        pageColorDark: Colors.brown[900],
        pageColorLight: Colors.brown[500],
        cardTheme: const CardTheme(surfaceTintColor: Colors.white,color: Colors.white),
        titleStyle: const TextStyle(color: Colors.white),
      ),
      hideForgotPasswordButton: true,
      userType: LoginUserType.name,
      messages: LoginMessages(userHint: 'Username'),
      userValidator: (value) => (value?.isEmpty ?? true) ? 'Username cannot be empty!' : null,
      title: 'Library',
      onLogin: (p0) => provider.login(p0.name, p0.password),
      onSignup: (p0) => provider.register(p0.name!, p0.password!),
      onSubmitAnimationCompleted: () {
        context.pushReplacement('/home');
      },
      onRecoverPassword: (p0) {},
    );
  }
}
