// Import the necessary Flutter packages
import 'package:flutter/material.dart';

// Define a stateless widget for the ProductCard
class ProductCard extends StatelessWidget {
  // Properties of the ProductCard widget
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  // Constructor for the ProductCard widget, with required properties
  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build the main structure of the ProductCard
    return Container(
      // Styling for the container, including border-radius and background color
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      // Margin and padding for the container
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the product title with a medium text style
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          // Display the product price with a small text style
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          // Centered display of the product image
          Center(
            child: Image.asset(
              image,
              height: 175,
            ),
          ),
        ],
      ),
    );
  }
}
