import 'package:flutter/material.dart';
import 'package:jastip_app/Styles/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Track the selected tab

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jastip',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            // const Icon(Icons.shopping_bag, color: Colors.pink),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Mau Jastip apa...',
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories Horizontal Scroll
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryItem(
                        'Yogyakarta', 'https://via.placeholder.com/80x60'),
                    _buildCategoryItem(
                        'Bandung', 'https://via.placeholder.com/600x400'),
                    _buildCategoryItem(
                        'Bali', 'https://via.placeholder.com/600x400'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Jastip Terpopuler
              const Text(
                "Jastip Terpopuler 😍",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard('Kaos Joger', '120 Orang Jastip',
                        'https://via.placeholder.com/600x400'),
                    _buildProductCard('Gelato Jogja', '80 Orang Jastip',
                        'https://via.placeholder.com/600x400'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Jastiper Top
              const Text(
                "Jastiper Top 😎",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildJastiperItem('Moh. Supar', '1.421 points • ⭐⭐⭐⭐⭐',
                      'https://via.placeholder.com/600x400'),
                  _buildJastiperItem('Tamala Petty', '1.300 points • ⭐⭐⭐⭐',
                      'https://via.placeholder.com/600x400'),
                ],
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  // Helper method to build category item
  Widget _buildCategoryItem(String title, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 80,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Helper method to build product card
  Widget _buildProductCard(String title, String subtitle, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(imageUrl,
                  fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  // Helper method to build Jastiper item
  Widget _buildJastiperItem(String name, String info, String imageUrl) {
    return Expanded(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(info),
      ),
    );
  }
}


