import 'package:am_shops/controller/logic.dart';
import 'package:am_shops/screen/add_card_screen.dart';
import 'package:am_shops/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:am_shops/model/api_model.dart';
import 'package:am_shops/screen/product_detail_screen.dart';
import 'package:am_shops/widget/card_button.dart';
import 'package:am_shops/widget/circular_progress_indicator.dart';
import 'package:am_shops/widget/filter_option.dart';
import 'package:am_shops/widget/sorting_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<ProductData> cardProduct = [];
  static List<ProductData> productCard = [];
  bool isDataLoaded = true;
  String errorMessage = "";
  static ValueNotifier<int> totalProductCards = ValueNotifier(0);
  final userInput = TextEditingController();
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  String selectedFilter = "";
  String selectedSort = "None";

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  Future<void> getDetail() async {
    final result = await LogicAPI.getDetailProduct();
    setState(() {
      isDataLoaded = false;
      result.fold(
        (l) {
          errorMessage = l;
        },
        (r) {
          cardProduct = r;
          errorMessage = "";
        },
      );
    });
  }

  void showSortingBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SortingBottomSheet(
          onSelect: (String sortOption) {
            setState(
              () {
                selectedSort = sortOption;
                if (selectedSort == "High to Low") {
                  for (int i = 0; i < cardProduct.length; i++) {
                    for (int j = 0; j < cardProduct.length - i - 1; j++) {
                      if (cardProduct[j].price < cardProduct[j + 1].price) {
                        var temp = cardProduct[j];
                        cardProduct[j] = cardProduct[j + 1];
                        cardProduct[j + 1] = temp;
                      }
                    }
                  }
                } else if (selectedSort == "Low to High") {
                  for (int i = 0; i < cardProduct.length; i++) {
                    for (int j = 0; j < cardProduct.length - i - 1; j++) {
                      if (cardProduct[j].price > cardProduct[j + 1].price) {
                        var temp = cardProduct[j];
                        cardProduct[j] = cardProduct[j + 1];
                        cardProduct[j + 1] = temp;
                      }
                    }
                  }
                } else {
                  for (int i = 0; i < cardProduct.length; i++) {
                    for (int j = 0; j < cardProduct.length - i - 1; j++) {
                      if (cardProduct[j].rate < cardProduct[j + 1].rate) {
                        var temp = cardProduct[j];
                        cardProduct[j] = cardProduct[j + 1];
                        cardProduct[j + 1] = temp;
                      }
                    }
                  }
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "AM SHOP",
          style: TextStyle(
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Badge(
              label: ValueListenableBuilder(
                valueListenable: totalProductCards,
                builder: (context, value, child) => Text("$value"),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("add-card-screen")
                      .then((value) {
                    setState(() {
                      for (var product in cardProduct) {
                        product.isInCart = productCard.contains(product);
                      }
                    });
                  });
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: isDataLoaded
            ? const CircularLoadingIndicator()
            : errorMessage.isNotEmpty
                ? Center(
                    child: Text(
                      errorMessage,
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  )
                : Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilterOption(
                              isSelected: isSelected1,
                              onTap: () {
                                setState(() {
                                  selectedFilter = "";
                                  isSelected1 = true;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  isSelected4 = false;
                                  isSelected5 = false;
                                });
                              },
                              text: "All",
                              width: 75,
                            ),
                            FilterOption(
                              isSelected: isSelected2,
                              onTap: () {
                                setState(() {
                                  selectedFilter = "men's clothing";
                                  isSelected1 = false;
                                  isSelected2 = true;
                                  isSelected3 = false;
                                  isSelected4 = false;
                                  isSelected5 = false;
                                });
                              },
                              text: "Men",
                              width: 75,
                            ),
                            FilterOption(
                              isSelected: isSelected3,
                              onTap: () {
                                setState(() {
                                  selectedFilter = "women's clothing";
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = true;
                                  isSelected4 = false;
                                  isSelected5 = false;
                                });
                              },
                              text: "Women",
                              width: 75,
                            ),
                            FilterOption(
                              isSelected: isSelected4,
                              onTap: () {
                                setState(() {
                                  selectedFilter = "electronics";
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  isSelected4 = true;
                                  isSelected5 = false;
                                });
                              },
                              text: "Electronics",
                              width: 95,
                            ),
                            FilterOption(
                              isSelected: isSelected5,
                              onTap: () {
                                setState(() {
                                  selectedFilter = "jewelery";
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                  isSelected4 = false;
                                  isSelected5 = true;
                                });
                              },
                              text: "Jewelery",
                              width: 95,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: userInput,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            suffixIcon: userInput.text.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        userInput.clear();
                                      });
                                    },
                                    icon: const Icon(Icons.close,
                                        color: Colors.grey),
                                  )
                                : null,
                            hintText: 'Search item...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sort by:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.sort),
                              onPressed: showSortingBottomSheet,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: buildCardList(),
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget buildCardList() {
    String searchQuery = userInput.text.toLowerCase();
    final filterProduct = cardProduct
        .where(
          (element) =>
              element.title.toLowerCase().contains(searchQuery) &&
              (selectedFilter.isEmpty || element.category == selectedFilter),
        )
        .toList();

    // No sorting logic here as requested

    if (filterProduct.isEmpty) {
      return const Center(
        child: Text(
          "Product not found",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: filterProduct.length,
      itemBuilder: (context, index) {
        final product = filterProduct[index];
        return buildProductCard(product);
      },
    );
  }

  Widget buildProductCard(ProductData product) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(
                product: product,
              );
            },
          ),
        ).then((_) {
          setState(() {});
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.grey.shade50,
          child: Row(
            children: [
              Container(
                width: 120,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Hero(
                  tag: product.image,
                  child: Image.network(product.image),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Text("⭐ "),
                          Text("${product.rate} / "),
                          Text("${product.count}"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          productCard.contains(product)
                              ? CartButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AddCardProduct(
                                            product:
                                                HomeScreenState.productCard,
                                            totalProductCards: HomeScreenState
                                                .totalProductCards,
                                          );
                                        },
                                      ),
                                    ).then((_) {
                                      setState(() {
                                        product.isInCart = HomeScreenState
                                            .productCard
                                            .contains(product);
                                      });
                                    });
                                  },
                                  text: "Go to Bag",
                                )
                              : CartButton(
                                  onPressed: () {
                                    setState(() {
                                      product.isInCart = true;
                                      productCard.add(product);
                                      totalProductCards.value++;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          duration: Duration(milliseconds: 500),
                                          content: Text("Added Successfully"),
                                        ),
                                      );
                                    });
                                  },
                                  text: "Add to cart",
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
