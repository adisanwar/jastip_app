import 'package:flutter/material.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';
import 'package:jastip_app/Screens/Auth/register.dart';
import 'package:jastip_app/Screens/Home/HomePage.dart';
import 'package:jastip_app/Widget/button_primary.dart';
import 'package:jastip_app/Widget/text_form.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormPrimary(controller: _usernameController, labelText: 'Username atau Email', prefixIcon: const Icon(Icons.person),),
            // TextField(
            //   controller: _usernameController,
            //   decoration: const InputDecoration(labelText: 'Username'),
            // ),
            SizedBox(height: 10,),
            FormPrimary(controller: _passwordController, labelText: 'Password', obscureText: true, prefixIcon: Icon(Icons.key),),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ButtonPrimary(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
            const SizedBox(height: 20),
            // Tambahkan teks register
            TextButton(
              onPressed: () {
                // Navigasi ke halaman register
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
  setState(() {
    _isLoading = true;
    _errorMessage = '';
  });

  final username = _usernameController.text;
  final email = _emailController.text;
  final password = _passwordController.text;

  final authProvider = Provider.of<AuthProvider>(context, listen: false);

  // Tentukan apakah input adalah email atau username
  final isEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(email);
  final identifier = isEmail ? email : username; // Jika email, kirimkan email, jika tidak kirimkan username

  final success = await authProvider.login(identifier, password);

  setState(() {
    _isLoading = false;
  });

  if (success) {
    // Navigasi ke HomePage jika login berhasil
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  } else {
    setState(() {
      _errorMessage = 'Login gagal. Periksa username dan password.';
    });
  }
}


}