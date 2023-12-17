import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action here
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductGridItem(product: product);
        },
      ),
    );
  }
}

class ProductGridItem extends StatelessWidget {
  //digunakan untuk menampilkan setiap produk dalam grid
  final Product product;

  ProductGridItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //widget yang memberikan efek interaktif ketika pengguna mengetuk item produk
      onTap: () {
        navigateToDetailPage(context, product);
      },
      child: Card(
        //untuk membuat kartu yang mengandung informasi produk, termasuk gambar, nama, harga, rating, dan deskripsi produk.
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              //untuk mengatur elemen-elemen dalam tumpukan
              alignment: Alignment
                  .topRight, // Membuat ikon keranjang di atas kanan gambar produk
              children: [
                Image.network(
                  //widget yang digunakan untuk menampilkan gambar produk dari URL yang diberikan.
                  product.image,
                  height: 50.0, // Mengubah ukuran gambar menjadi lebih besar
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                IconButton(
                  //tombol ikon yang digunakan untuk menambahkan produk ke keranjang
                  icon: Icon(Icons.shopping_cart, color: Colors.red),
                  onPressed: () {
                    // Tambahkan logika ketika keranjang ditekan (misalnya, menambahkan produk ke keranjang)
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Rp ${product.price}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Text(product.rating.toString()),
                  ],
                ),
                Icon(Icons
                    .favorite_border), // Ikon favorit (atau sesuaikan dengan yang Anda butuhkan)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  //digunakan untuk mendefinisikan atribut-atribut produk
  final String id;
  final String name;
  final String image;
  final String price;
  final double rating;
  final String description;

  Product({
    //daftar produk yang akan ditampilkan dalam halaman "Product List"
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });
}

List<Product> productList = [
  Product(
    id: '1',
    name: 'Samsung Galaxy A24',
    image:
        'https://media.dinomarket.com/docs/imgTD/2023-05/DM_1379CF3FD8BC3CFE3C395983665C9704_130523110550_ll.jpg',
    price: 'Rp 2.975.000',
    rating: 5.5,
    description:
        'Samsung Keluaran terbaru yang rilis pada tahun 2022 dengan procesor Octa core 2.6 Ghz dan kamera_belakang: 13 MP + 8 MP + 5 MP, kamera_depan: 8 MP, dengan bentuk minimalis yang di desain khusus untuk para pecinta gadget galaxy',
  ),
  Product(
    id: '2',
    name: 'Samsung Galaxy A34 5G',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn23mdQdZsudFTfY3cTS3gpk1-YlLexTscnQCiy3nG4LimBKlEs4syxXJwGeOOYFrkuu4&usqp=CAU',
    price: 'Rp 4.145.000',
    rating: 5.5,
    description: 'kamera_belakang: 48 MP + 8 MP + 2 MP, kamera_depan: 13 MP',
  ),
  Product(
      id: '3',
      name: 'Samsung Galaxy A14 5G',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlZzW1SpjROt-staQFke2A5YbJ2-t5pEb37GYmEvmvNCzFDNlrt9cZ82M2P_BzcDeAxqM&usqp=CAU',
      price: 'Rp 2.525.000',
      rating: 5.5,
      description:
          'kamera_belakang: 48 MP + 8 MP + 2 MP, kamera_depan: 13 MP.,'),
  Product(
      id: '4',
      name: 'Samsung Galaxy A04',
      image:
          'https://media.dinomarket.com/docs/imgTD/2023-05/DM_1379CF3FD8BC3CFE3C395983665C9704_130523110550_ll.jpg',
      price: 'Rp 1.320.000',
      rating: 5.5,
      description:
          'kamera_belakang: 58 MP + 8 MP + 5 MP, kamera_depan: 17 MP.,'),
  Product(
      id: '5',
      name: 'Samsung Galaxy A23 5G',
      image:
          'https://img.global.news.samsung.com/id/wp-content/uploads/2023/03/23110630/A23.png',
      price: 'Rp 3.070.000',
      rating: 5.5,
      description:
          'kamera_belakang: 48 MP + 12 MP + 5 MP, kamera_depan: 17 MP.'),

  Product(
    id: '8',
    name: 'Samsung Galaxy A73 5G',
    image:
        'https://images.samsung.com/is/image/samsung/assets/id/offer/2022/04/a73/id-A73_Awesome-White_ProductKV_MO_img.jpg',
    price: 'Rp 12.700.000',
    rating: 5.5,
    description:
        'Bahan yang digunakan untuk kerudung ini mungkin bervariasi tergantung pada merek dan produsen,'
        'tetapi biasanya mereka terbuat dari bahan yang ringan, seperti katun atau chiffon.'
        ' Kerudung Malay Khimar biasanya memiliki desain yang longgar dan nyaman untuk dipakai sehari-hari, dengan ukuran yang cukup besar untuk menutupi seluruh tubuh kecuali wajah dan tangan.',
  ),

  Product(
    id: '9',
    name: 'Samsung Galaxy A34 5G',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn23mdQdZsudFTfY3cTS3gpk1-YlLexTscnQCiy3nG4LimBKlEs4syxXJwGeOOYFrkuu4&usqp=CAU',
    price: 'Rp 15.000.000',
    rating: 5.5,
    description:
        'Bahan yang digunakan untuk kerudung ini mungkin bervariasi tergantung pada merek dan produsen,'
        'tetapi biasanya mereka terbuat dari bahan yang ringan, seperti katun atau chiffon.'
        ' Kerudung Malay Khimar biasanya memiliki desain yang longgar dan nyaman untuk dipakai sehari-hari, dengan ukuran yang cukup besar untuk menutupi seluruh tubuh kecuali wajah dan tangan.',
  ),

  Product(
      id: '10',
      name: 'Samsung Galaxy A14 5G',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlZzW1SpjROt-staQFke2A5YbJ2-t5pEb37GYmEvmvNCzFDNlrt9cZ82M2P_BzcDeAxqM&usqp=CAU',
      price: 'Rp 12.525.000',
      rating: 5.5,
      description:
          'Bahan yang digunakan untuk kerudung ini mungkin bervariasi tergantung pada merek dan produsen,'),

  // Tambahkan produk lainnya sesuai kebutuhan
];
