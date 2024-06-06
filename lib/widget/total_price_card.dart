import 'package:flutter/material.dart';
import 'package:am_shops/model/api_model.dart';
import 'package:am_shops/widget/show_model_button.dart';

class TotalPriceCard extends StatelessWidget {
  final List<ProductData> product;
  final context;
 const TotalPriceCard({
    Key? key,
    required this.product,
    required this.context,
  }) : super(key: key);
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
