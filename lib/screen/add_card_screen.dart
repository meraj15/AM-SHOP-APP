import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:am_shops/model/api_model.dart';
import 'package:am_shops/widget/quantity_selector.dart';
import 'package:am_shops/widget/show_model_button.dart';
import 'package:am_shops/widget/size_selector.dart';
import 'package:am_shops/widget/total_price_card.dart';

class AddCardProduct extends StatefulWidget {
  List<ProductData> product;
  ValueNotifier<int> totalProductCards;

  AddCardProduct({
    required this.product,
    required this.totalProductCards,
  });

  @override
  State<AddCardProduct> createState() => _AddCardProductState();
}

class _AddCardProductState extends State<AddCardProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(widget.product);
            setState(() {});
          },
          icon:const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        title: const Text(
          "My Bag",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55.0),
        child: listViewBuilder(),
      ),
      bottomSheet: TotalPriceCard(product: widget.product, context: context),
    );
  }

  Widget listViewBuilder() {
    if (widget.product.isEmpty) {
      return const Center(
        child: Text(
          "No card available!!!",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: widget.product.length,
      itemBuilder: (context, index) {
        final cards = widget.product[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            color: Colors.grey.shade50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 170,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Hero(
                      tag: cards.image,
                      child: Image.network(cards.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "A&M",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              fontSize: 14),
                        ),
                        Text(
                          cards.title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Text(
                          "Sold by: A & M Codielm..",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                     showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter updateOnTime) {
                                        return SizedBox(
                                          height: 216,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Select Size",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();

                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.orange,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      SizeSelector(
                                                        checkSizeCondition: 1,
                                                        selectedSize: "XS",
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                                  .selectedSize =
                                                              "XL";
                                                          updateOnTime(() {
                                                            SizeSelectorState
                                                                .selectedIndexSize = 1;
                                                          });
                                                        },
                                                      ),
                                                      SizeSelector(
                                                        checkSizeCondition: 2,
                                                        selectedSize: "S",
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                                  .selectedSize =
                                                              "S";
                                                          updateOnTime(() {
                                                            SizeSelectorState
                                                                .selectedIndexSize = 2;
                                                          });
                                                        },
                                                      ),
                                                      SizeSelector(
                                                        checkSizeCondition: 3,
                                                        selectedSize: "M",
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                                  .selectedSize =
                                                              "M";
                                                          updateOnTime(() {
                                                            SizeSelectorState
                                                                .selectedIndexSize = 3;
                                                          });
                                                        },
                                                      ),
                                                      SizeSelector(
                                                        checkSizeCondition: 4,
                                                        selectedSize: "L",
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                                  .selectedSize =
                                                              "L";
                                                          updateOnTime(() {
                                                            SizeSelectorState
                                                                .selectedIndexSize = 4;
                                                          });
                                                        },
                                                      ),
                                                      SizeSelector(
                                                        checkSizeCondition: 5,
                                                        selectedSize: "XL",
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                                  .selectedSize =
                                                              "XL";
                                                          updateOnTime(() {
                                                            SizeSelectorState
                                                                .selectedIndexSize = 5;
                                                          });
                                                        },
                                                      ),
                                                      SizeSelector(
                                                        checkSizeCondition: 6,
                                                        selectedSize: "XXL",
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                                  .selectedSize =
                                                              "XXL";
                                                          updateOnTime(() {
                                                            SizeSelectorState
                                                                .selectedIndexSize = 6;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 13),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    "\$${cards.price * cards.selectedquantity}",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 7, left: 10),
                                                  child: RichText(
                                                    text: const TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'Seller:',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' A & M Codielm Retail Private Limited',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child: ShowModelButton(
                                                    height: 45,
                                                    title: "Done",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 87,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade50,
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Size:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      " ${widget.product[index].selectedSize}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            GestureDetector(
                              onTap: () {
                                   showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter updateOnTime) {
                                        return SizedBox(
                                          height: 192,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Select Quantity",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.orange,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      QuantitySelector(
                                                        quantity: 1,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 1;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 1;
                                                          });
                                                        },
                                                      ),
                                                      QuantitySelector(
                                                        quantity: 2,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 2;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 2;
                                                          });
                                                        },
                                                      ),
                                                      QuantitySelector(
                                                        quantity: 3,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 3;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 3;
                                                          });
                                                        },
                                                      ),
                                                      QuantitySelector(
                                                        quantity: 4,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 4;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 4;
                                                          });
                                                        },
                                                      ),
                                                      QuantitySelector(
                                                        quantity: 5,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 5;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 5;
                                                          });
                                                        },
                                                      ),
                                                      QuantitySelector(
                                                        quantity: 6,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 6;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 6;
                                                          });
                                                        },
                                                      ),
                                                      QuantitySelector(
                                                        quantity: 7,
                                                        updateOnTime: () {
                                                          widget.product[index]
                                                              .selectedquantity = 7;
                                                          updateOnTime(() {
                                                            QuantitySelectorState
                                                                .selectedIndexQuantity = 7;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 44),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child: ShowModelButton(
                                                    height: 45,
                                                    title: "Done",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                   );
                              },
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade50,
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Qty:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      " ${widget.product[index].selectedquantity}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$${cards.price * cards.selectedquantity}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '7 days',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: ' return available',
                                style: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: 1.1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    widget.totalProductCards.value--;
                    widget.product[index].selectedSize = "S";
                    widget.product[index].selectedquantity = 1;
                    widget.product.removeAt(index);
                    SizeSelectorState.selectedIndexSize = 2;
                    QuantitySelectorState.selectedIndexQuantity = 1;
                    setState(() {});
                  },
                  icon:const Icon(
                    Icons.close,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
