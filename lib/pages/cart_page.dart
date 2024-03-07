import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

// Import the necessary Flutter packages


// Define a stateless widget for the CartPage
class CartPage extends StatelessWidget {
  // Constructor for CartPage, using a key parameter (super.key is not valid syntax)
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the 'cart' data from the CartProvider using the watch method
    final cart = context.watch<CartProvider>().cart;

    // Alternatively, you can use Provider.of<CartProvider>(context).cart instead of watch
    /*
    final cart = Provider.of<CartProvider>(context).cart;
    */

    // Build the main structure of the CartPage
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          // Access the current cart item based on the index
          final cartItem = cart[index];

          // Build a ListTile for each item in the cart
          return ListTile(
            // Display the product image as a CircleAvatar in the leading position
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            // Add a delete button in the trailing position
            trailing: IconButton(
              onPressed: () {
                // Show a confirmation dialog before removing the product from the cart
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                        'Are you sure you want to remove the product from your cart ?',
                      ),
                      actions: [
                        // No button to dismiss the dialog
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        // Yes button to remove the product from the cart
                        TextButton(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .removeProduct(cartItem);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            // Display the product title and size as the title and subtitle of the ListTile
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size :${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
