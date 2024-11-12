// import 'package:flutter/material.dart';
// import 'package:jastip_app/Widget/text_form.dart';
// import 'package:provider/provider.dart';
// import 'register_provider.dart';
// // import 'register_model.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final registerProvider = Provider.of<RegisterProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               FormTextPrimary(controller: _passwordController, 
//               labelText: "Password", 
//               obscureText: true, 
//               validator: (value) {
//                 if (value == null || value.length < 6) {
//                     return "Password must be at least 6 characters";
//                   }
//                   return null;
//               },)
              
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) {
//                   if (value == null || !value.contains('@')) {
//                     return "Please enter a valid email";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               registerProvider.isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           final user = RegisterModel(
//                             username: _usernameController.text,
//                             password: _passwordController.text,
//                             email: _emailController.text,
//                           );

//                           bool success = await registerProvider.register(user);
//                           if (success) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("Registration successful")),
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text(registerProvider.errorMessage ?? "Registration failed")),
//                             );
//                           }
//                         }
//                       },
//                       child: Text("Register"),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
