import 'package:flutter/material.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';
import 'package:jastip_app/Screens/Auth/login.dart';
import 'package:provider/provider.dart';
// import 'auth_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: authProvider.token == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, ${authProvider.username}'),
                  Text('Email: ${authProvider.email ?? 'N/A'}'),
                  Text('Status: ${authProvider.status ?? 'N/A'}'),
                  Text('Role: ${authProvider.role ?? 'N/A'}'),
                  SizedBox(height: 20),
                  Text('Token: ${authProvider.token}'),
                ],
              ),
      ),
    );
  }
}
