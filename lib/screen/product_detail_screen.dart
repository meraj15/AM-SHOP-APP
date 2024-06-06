import 'package:flutter/material.dart';
import 'package:am_shops/model/api_model.dart';
import 'package:am_shops/screen/home_screen.dart';
import 'package:am_shops/screen/add_card_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductData product;

  const ProductDetailScreen({required this.product});

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Product Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.product.image,
            child: Image.network(
              widget.product.image,
              width: double.infinity,
              height: 300,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.category.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "\$${widget.product.price}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.product.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              HomeScreenState.productCard.contains(widget.product)
                  ? buildCartButton(
                      "Go to Bag",
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AddCardProduct(
                                product: HomeScreenState.productCard,
                                totalProductCards:
                                    HomeScreenState.totalProductCards,
                              );
                            },
                          ),
                        ).then((_) {
                          setState(() {
                            widget.product.isInCart = HomeScreenState
                                .productCard
                                .contains(widget.product);
                          });
                        });
                      },
                    )
                  : buildCartButton(
                      "Add to cart",
                      () {
                        setState(() {
                          widget.product.isInCart = true;
                          HomeScreenState.productCard.add(widget.product);
                          HomeScreenState.totalProductCards.value++;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 500),
                              content: Text("Added Successfully"),
                            ),
                          );
                        });
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCartButton(String text, VoidCallback onTap) {
    return Expanded(
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.orange,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.orange),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
