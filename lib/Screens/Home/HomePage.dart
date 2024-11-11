import 'package:flutter/material.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';
import 'package:jastip_app/Screens/Auth/login.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Memanggil fungsi logout dengan BuildContext
              await authProvider.logout(context);
              // Mengarahkan ke halaman login setelah logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: authProvider.token == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, ${authProvider.username ?? 'User'}'),
                  Text('Email: ${authProvider.email ?? 'N/A'}'),
                  Text('Status: ${authProvider.status ?? 'N/A'}'),
                  Text('Role: ${authProvider.role ?? 'N/A'}'),
                  const SizedBox(height: 20),
                  Text('Token: ${authProvider.token ?? 'N/A'}'),
                ],
              ),
      ),
    );
  }
}
