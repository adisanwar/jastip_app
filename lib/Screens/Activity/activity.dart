import 'package:flutter/material.dart';
import 'package:jastip_app/Styles/colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late AutoScrollController autoScrollController;
  final List<String> tabs = ['Riwayat', 'Ongoing', 'Draft']; // Simplified data

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    autoScrollController = AutoScrollController();
  }

  @override
  void dispose() {
    tabController.dispose();
    autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aktivitas')),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.black,
            tabs: tabs.map((title) {
              return Tab(text: title);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                History(), // Replace with your "Overview" content
                OnGoing(),
                DraftPage() // Replace with your "Specification" content
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example widgets for "Overview" and "Specification" sections

class History extends StatelessWidget {
  // Sample list of products
  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description of Product 1', price: 100),
    Product(name: 'Product 2', description: 'Description of Product 2', price: 200),
    Product(name: 'Product 3', description: 'Description of Product 3', price: 300),
    Product(name: 'Product 4', description: 'Description of Product 4', price: 400),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(product.description),
          trailing: Text('\$${product.price}'),
          onTap: () {
            // Handle tap event (e.g., navigate to product details)
          },
        );
      },
    );
  }
}

// Product model
class Product {
  final String name;
  final String description;
  final double price;

  Product({required this.name, required this.description, required this.price});
}


class OnGoing extends StatelessWidget {
  // Sample list of products
  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description of Product 1', price: 100),
    Product(name: 'Product 2', description: 'Description of Product 2', price: 200),
    Product(name: 'Product 3', description: 'Description of Product 3', price: 300),
    Product(name: 'Product 4', description: 'Description of Product 4', price: 400),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(product.description),
          trailing: Text('\$${product.price}'),
          onTap: () {
            // Handle tap event (e.g., navigate to product details)
          },
        );
      },
    );
  }
}

class DraftPage extends StatelessWidget {
 // Sample list of products
  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description of Product 1', price: 100),
    Product(name: 'Product 2', description: 'Description of Product 2', price: 200),
    Product(name: 'Product 3', description: 'Description of Product 3', price: 300),
    Product(name: 'Product 4', description: 'Description of Product 4', price: 400),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(product.description),
          trailing: Text('\$${product.price}'),
          onTap: () {
            // Handle tap event (e.g., navigate to product details)
          },
        );
      },
    );
  }
}
