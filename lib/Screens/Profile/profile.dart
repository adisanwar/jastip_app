import 'package:flutter/material.dart';
import 'package:jastip_app/Provider/AuthProvider/auth_provider.dart';
import 'package:jastip_app/Screens/Activity/activity.dart';
import 'package:jastip_app/Screens/Auth/login.dart';
import 'package:jastip_app/Screens/Cart/cart.dart';
import 'package:jastip_app/Styles/colors.dart';
import 'package:jastip_app/Utils/routers.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _showLogoutDialog(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Dialog cannot be closed by tapping outside
      builder: (BuildContext dialogContext) {
        return LogoutDialog(
          dialogContext: dialogContext,
          authProvider: authProvider,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          // Background with curved shape
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      // Profile image with icon to change photo
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.camera_alt, color: Colors.blue, size: 20),
                                onPressed: () {
                                  // Function to change photo
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Kobby Michael',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '@kobbymich',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Profile options
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        _buildProfileOption(
                          icon: Icons.favorite_border,
                          title: 'Wishlist',
                          trailing: const Chip(
                            label: Text('2'),
                            backgroundColor: Colors.blue,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            PageNavigator(ctx: context)
                                .nextPage(page:  const CartScreen());
                            // Navigate to Wishlist
                          },
                        ),
                        _buildProfileOption(
                          icon: Icons.history,
                          title: 'History',
                          onTap: () {
                            PageNavigator(ctx: context)
                                .nextPage(page:  const ActivityScreen());
                            // Navigate to History
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Additional options
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        _buildProfileOption(
                          icon: Icons.payment,
                          title: 'Payment Method',
                          onTap: () {
                            // Navigate to Payment Method
                          },
                        ),
                        _buildProfileOption(
                          icon: Icons.notifications_outlined,
                          title: 'Notifications',
                          onTap: () {
                            // Navigate to Notifications
                          },
                        ),
                        _buildProfileOption(
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacy Policy',
                          onTap: () {
                            // Navigate to Privacy Policy
                          },
                        ),
                        _buildProfileOption(
                          icon: Icons.settings,
                          title: 'Settings',
                          onTap: () {
                            // Navigate to Settings
                          },
                        ),
                        _buildProfileOption(
                          icon: Icons.help,
                          title: 'About',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AboutDialogPopup();
                              },
                            );
                            // Navigate to Settings
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Logout card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text('Logout', style: TextStyle(color: Colors.red)),
                      onTap: () => _showLogoutDialog(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class LogoutDialog extends StatefulWidget {
  final BuildContext dialogContext;
  final AuthProvider authProvider;

  const LogoutDialog({
    required this.dialogContext,
    required this.authProvider,
    super.key,
  });

  @override
  _LogoutDialogState createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi Logout'),
      content: isLoading
          ? const Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Sedang memproses...'),
              ],
            )
          : const Text('Apakah Anda yakin ingin logout?'),
      actions: <Widget>[
        if (!isLoading)
          TextButton(
            child: const Text('Batal', style: TextStyle(color: primaryColor),),
            onPressed: () {
              Navigator.of(widget.dialogContext).pop(); // Close dialog
            },
          ),
        TextButton(
  onPressed: isLoading
      ? null
      : () async {
          setState(() {
            isLoading = true;
          });

          // Call logout function
          await widget.authProvider.logout(context);

          // Introduce a 5-second delay before navigating
          // await Future.delayed(const Duration(seconds: 5));

          // Navigate to login page
          Navigator.of(widget.dialogContext).pop(); // Close dialog
          PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
        },
  child: Text(isLoading ? '' : 'Ya', style: const TextStyle(color: Colors.red)),
)

      ],
    );
  }
}

class AboutDialogPopup extends StatelessWidget {
  const AboutDialogPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
      content: const Text(
        'This app is built to demonstrate a customizable profile section with an About page popup. '
            'You can add more details here.',
        textAlign: TextAlign.justify,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}