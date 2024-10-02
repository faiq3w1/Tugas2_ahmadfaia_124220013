import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String email;

  const HomePage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    // List produk dari folder assets
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Produk 1',
        'image': 'assets/image/tugas.jpg',
        'description': 'INI SEPEDA GUNUNG',
        'price': 100000.0
      },
      {
        'name': 'Produk 2',
        'image': 'assets/image/tugass.jpeg',
        'description': 'INI SEPEDA GUNUNG',
        'price': 200000.0
      },
      {
        'name': 'Produk 3',
        'image': 'assets/image/tugasss.jpeg',
        'description': 'INI SEPEDA GUNUNG',
        'price': 150000.0
      },
      {
        'name': 'Produk 4',
        'image': 'assets/image/spda1.jpeg',
        'description': 'INI SEPEDA GUNUNG',
        'price': 120000.0
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bicycle Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    username: username,
                    email: email, // Tambahkan pengiriman email
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ListView horizontal untuk gambar poster promosi
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true, // Tambahkan shrinkWrap untuk mencegah overflow
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/image/tugas.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/image/tugass.jpeg'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/image/tugasss.jpeg'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/image/spda1.jpeg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Tampilkan pesan selamat datang dengan email
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, $email!', // Email pengguna ditampilkan
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // GridView untuk produk
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10, // Tambahkan jarak antar item
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              padding: const EdgeInsets.all(8.0), // Padding untuk GridView
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 4, // Sedikit efek bayangan pada card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama produk
                            Text(
                              product['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Harga produk
                            Text(
                              'Rp${product['price'].toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Tombol beli
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      productName: product['name'],
                                      productImage: product['image'],
                                      productDescription:
                                          product['description'],
                                      productPrice: product['price'],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                              child: const Text('Beli'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
