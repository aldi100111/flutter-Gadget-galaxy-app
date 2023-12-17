import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart'; // Ganti sesuai dengan lokasi file ProfilePage
import 'package:flutter_application_1/pages/Product_ListPage.dart';
import 'package:flutter_application_1/pages/detailpage.dart';

// Impor DetailPage
late final FirebaseApp app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBwgVx4Usy61WBYwiP7dehdMqAaTjosjH0",
          appId: "1:626218295278:web:2b1c147d2e30089cc338ff",
          messagingSenderId: "626218295278",
          projectId: "komik-app-e7611"));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gadget Galaxy App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //kelas yang mewarisi dari StatefulWidget
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //kelas private yang mewarisi dari State<MyHomePage>
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ProductListPage(),
    ProfilePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //kerangka kerja dasar yang digunakan untuk membangun antarmuka pengguna dalam Flutter
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //widget yang digunakan untuk membuat bilah navigasi di bagian bawah layar
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile', // Ubah label ke "Profile"
            icon: Icon(Icons.person), // Gunakan ikon "person" untuk profil
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}

void navigateToDetailPage(BuildContext context, Product product) {
  Navigator.push(
    //untuk mengelola perpindahan antara berbagai halaman dalam aplikasi
    context,
    MaterialPageRoute(
      builder: (context) => DetailPage(product: product),
    ),
  );
}
