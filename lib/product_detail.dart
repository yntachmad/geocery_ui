import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocery_ui/bloc/item_card.dart';

import 'data.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    ItemCard itemCard = (context).read<ItemCard>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
        Center(
          child: Hero(
            tag: product.image,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey,
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Row(children: [
            Text(
              'Rp. ${product.price}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '/ ${product.quantity}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )
          ]),
        ),
        Expanded(
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(20),
            child: Text(
              product.description,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ),
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.bottomCenter,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder<ItemCard, int>(
                bloc: itemCard,
                buildWhen: (previous, current) {
                  if (current <= 1) {
                    return false;
                  } else {
                    return true;
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            itemCard.decrement();
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                          color: Colors.white,
                        ),
                        Text(
                          '$state',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                          onPressed: () {
                            itemCard.increment();
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Center(
                child: Container(
                  width: 190,
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}


