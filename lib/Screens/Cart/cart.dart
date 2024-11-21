import 'package:flutter/material.dart';
import 'package:jastip_app/Styles/colors.dart';

import '../../Widget/button_primary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang Saya',
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        // actions: [
        //   CircleAvatar(
        //     backgroundColor: Colors.grey.shade300,
        //     child: Icon(Icons.person, color: Colors.white), // Placeholder avatar
        //   ),
        //   SizedBox(width: 16),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CartItem(
                    imageUrl:
                    'https://via.placeholder.com/150/leaf_plant.png', // URL gambar
                    title: 'Leaf Plant',
                    author: '@mehmetozsoy',
                    price: 19.90,
                    size: 'M',
                  ),
                  CartItem(
                    imageUrl:
                    'https://via.placeholder.com/150/super_plant.png', // URL gambar
                    title: 'Super Plant',
                    author: '@robyaltmer',
                    price: 13.00,
                    size: 'M',
                  ),
                ],
              ),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub Total', style: TextStyle(fontSize: 16)),
                  Text('£32.90', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '£37.90',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            ButtonPrimary(onPressed: () {}, child: Text('Bayar'),
              
              
            )
            
            // ElevatedButton(
            //   onPressed: () {
            //     // Aksi tombol Buy Now
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.black,
            //     padding: EdgeInsets.symmetric(vertical: 16),
            //     minimumSize: Size(double.infinity, 50),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: Text(
            //     'Bayar',
            //     style: TextStyle(color: Colors.white, fontSize: 16),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final double price;
  final String size;

  const CartItem({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.price,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 80, color: Colors.grey);
              },
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    author,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text('Size $size'),
                  SizedBox(height: 8),
                  Text(
                    '£${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Aksi tombol tambah
                  },
                ),
                Text('1', style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Aksi tombol kurangi
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
