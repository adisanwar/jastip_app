import 'package:flutter/material.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';
import 'package:jastip_app/Provider/Database/db_provider.dart';
import 'package:jastip_app/Screens/Auth/login.dart';
import 'package:jastip_app/Screens/Home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jastip App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          // Jika token ada, arahkan ke HomePage, jika tidak arahkan ke LoginPage
          return authProvider.token != null
              ? const HomePage()
              : const LoginPage();
        },
      ),
    );
  }
}
