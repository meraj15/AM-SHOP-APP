import 'package:flutter/material.dart';
import 'package:am_shops/model/api_model.dart';
import 'package:am_shops/widget/show_model_button.dart';

class TotalPriceCard extends StatelessWidget {
  final List<ProductData> product;
  // ignore: prefer_typing_uninitialized_variables
  final context;
  const TotalPriceCard({
    super.key,
    required this.product,
    required this.context,
  });
  @override
  Widget build(BuildContext context) {
    num totalPrice = product.fold(
      0,
      (sum, item) => sum + (item.price * item.selectedquantity),
    );

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Your order was successful!"),
          ),
        );
      },
      child: ShowModelButton(
        height: 55,
        title: "Place Order: \$${totalPrice.toStringAsFixed(2)}",
      ),
    );
  }
}
