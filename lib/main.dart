import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocery_ui/bloc/item_card.dart';
import 'package:flutter_geocery_ui/item_widget.dart';

import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCard(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Geocery UI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final data = Product(
      name: 'Bayam',
      price: '2.000',
      quantity: '1 Ikat',
      image: 'assets/img1.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'GEOCERY UI',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: (() {}),
                icon: const Icon(Icons.search),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_rounded),
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemCount: allData.length,
          itemBuilder: (context, index) {
            return ItemWidget(product: allData[index]);
          },
        ),
      ),
    );
  }
}

final List<Product> allData = [
  Product(
      name: 'Bayam',
      price: '2.000',
      quantity: '1 Ikat',
      image: 'assets/img1.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral'),
  Product(
      name: 'Alpukat',
      price: '4.000',
      quantity: '1 kg',
      image: 'assets/img2.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral'),
  Product(
      name: 'Jagung',
      price: '9.500',
      quantity: '1 Bungkus',
      image: 'assets/img3.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral'),
  Product(
      name: 'Kiwi',
      price: '4.500',
      quantity: '1 kg',
      image: 'assets/img4.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral'),
  Product(
      name: 'Jeruk',
      price: '3.500',
      quantity: '1 kg',
      image: 'assets/img5.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral'),
  Product(
      name: 'Apel',
      price: '4.500',
      quantity: '1 kg',
      image: 'assets/img6.png',
      description:
          'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral'),
];
