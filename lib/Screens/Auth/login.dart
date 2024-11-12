import 'package:flutter/material.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';
import 'package:jastip_app/Screens/Auth/register.dart';
import 'package:jastip_app/Screens/Home/HomePage.dart';
import 'package:jastip_app/Styles/colors.dart';
import 'package:jastip_app/Utils/routers.dart';
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
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';
  bool _obscureText = true;

  // Method to toggle obscure text
  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Yok Jastip',
              style: TextStyle(
                  fontSize: 40,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            FormPrimary(
              controller: _usernameController,
              labelText: 'Username atau Email',
              prefixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 10),
            FormPrimary(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: _obscureText,
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: toggleObscureText,
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ButtonPrimary(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            // const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                PageNavigator(ctx: context)
                    .nextPage(page: const RegisterPage());
              },
              style: TextButton.styleFrom(
                foregroundColor:
                    primaryColor, // Ganti dengan warna yang Anda inginkan
              ),
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
    final password = _passwordController.text;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // Tentukan apakah input adalah email atau username
    final isEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(username);
    final identifier = isEmail ? username : username;

    final success = await authProvider.login(identifier, password);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
    } else {
      setState(() {
        _errorMessage = 'Login gagal. Periksa username dan password.';
      });
    }
  }
}
