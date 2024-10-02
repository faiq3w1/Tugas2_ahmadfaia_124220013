import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productDescription;
  final double productPrice;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName), // Menampilkan nama produk
        backgroundColor: Colors.deepPurple, // Mengatur warna AppBar
      ),
      body: Container(
        // Mengatur latar belakang dengan gradien
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black], // Warna gradien
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Card(
              // Kartu mengelilingi gambar dan teks
              elevation: 4, // Mengatur efek bayangan kartu
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Sudut membulat
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Padding di dalam kartu
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Membatasi ukuran kolom
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Menyelaraskan semua elemen ke tengah
                  children: [
                    // Gambar produk
                    Image.asset(
                      productImage, // Menggunakan gambar produk dari parameter
                      height: 200, // Mengurangi tinggi gambar
                      width: 200, // Mengurangi lebar gambar
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 12), // Jarak lebih kecil
                    // Nama produk
                    Text(
                      productName, // Menampilkan nama produk
                      style: const TextStyle(
                        fontSize: 20, // Ukuran font lebih kecil
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple, // Warna teks
                      ),
                      textAlign:
                          TextAlign.center, // Menyelaraskan teks ke tengah
                    ),
                    const SizedBox(height: 12), // Jarak lebih kecil
                    // Deskripsi produk
                    Text(
                      'Description',
                      style: const TextStyle(
                        fontSize: 16, // Ukuran font lebih kecil
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple, // Warna teks
                      ),
                      textAlign:
                          TextAlign.center, // Menyelaraskan teks ke tengah
                    ),
                    const SizedBox(height: 8), // Jarak lebih kecil
                    Text(
                      productDescription, // Menampilkan deskripsi produk
                      textAlign:
                          TextAlign.center, // Menyelaraskan teks ke tengah
                    ),
                    const SizedBox(height: 12), // Jarak lebih kecil
                    // Harga produk dan tombol Beli
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Menyelaraskan konten di tengah
                      children: [
                        Text(
                          'Price: Rp${productPrice.toStringAsFixed(0)}', // Menampilkan harga produk
                          style: const TextStyle(
                            fontSize: 16, // Ukuran font lebih kecil
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                            width:
                                12), // Jarak lebih kecil antara harga dan tombol
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Pembelian berhasil')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.deepPurple, // Warna tombol
                          ),
                          child: const Text('Beli'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
