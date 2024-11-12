import 'package:flutter/material.dart';
import 'package:jastip_app/Model/user_model.dart';
import 'package:jastip_app/Widget/button_primary.dart';
import 'package:jastip_app/Widget/text_form.dart';
import 'package:provider/provider.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormPrimary(
                controller: _usernameController,
                labelText: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FormPrimary(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FormPrimary(
                controller: _emailController,
                labelText: "Email",
                validator: (value) {
                  if (value == null || !value.contains("@")) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              authProvider.isLoading
                  ? const CircularProgressIndicator()
                  : ButtonPrimary(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Create user data object
                          final user = Data(
                            username: _usernameController.text,
                            password: _passwordController.text,
                            email: _emailController.text,
                            role: "Customer",
                          );

                          // Register user
                          bool success = await authProvider.register(
                            user.username!,
                            user.password!,
                            user.email!,
                            user.role!,
                          );

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Registration successful")),
                            );
                            Navigator.pop(
                                context); // Navigate back or to another page
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(authProvider.errorMessage ??
                                    "Registration failed"),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("Register"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
