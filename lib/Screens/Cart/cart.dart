import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample cart data (with product quantity)
  List<CartItem> cartItems = [
    CartItem(product: Product(name: 'Product 1', price: 100), quantity: 1),
    CartItem(product: Product(name: 'Product 2', price: 200), quantity: 2),
    CartItem(product: Product(name: 'Product 3', price: 300), quantity: 1),
  ];

  // Method to calculate total price
  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(cartItem.product.name),
                    subtitle: Text('Price: \$${cartItem.product.price}'),
                    trailing: Column(
                      children: [
                        Text('Qty: ${cartItem.quantity}'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (cartItem.quantity > 1) {
                                    cartItem.quantity--;
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  cartItem.quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${getTotalPrice()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}

// Product model
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

// Cart item model to manage quantity
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
