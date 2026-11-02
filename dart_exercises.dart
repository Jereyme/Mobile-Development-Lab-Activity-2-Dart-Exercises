import 'dart:io';

// This program lane searches for a product in a list of products using a while loop. It prompts the user to enter a product name and checks if it exists in the list. The program continues to ask the user if they want to search again until they choose to exit.
void main() {
  Map<String, int> products = {
    "Coke": 10,
    "Pepsi": 8,
    "Sprite": 5,
    "Royal": 0,
  };

  String choice = "yes";

  while (choice.toLowerCase() == "yes") {
    try {
      print("\n=== Sari-Sari Store Search System ===");
      print("Use the search feature to check availability.");
      print("Products: Coke, Pepsi, Sprite, Royal");
      print("=======================================");

      String item = getValidProduct(products);

      int stock = products[item]!;

      // This lane print the result whether the product is found or not.
      if (stock > 0) {
        print("✅ $item is available in the store.");
        print("📦 Stock Quantity: $stock");
      } else {
        print("❌ $item is currently out of stock.");
      }

      // This lane prompts the user to whether they want to search again or exit.
      stdout.write("Search again? (yes/no): ");
      choice = stdin.readLineSync()!;
    } catch (e) {
      print("Error: Invalid input.");
    }
  }

  print("\nThank you for using the Sari-Sari Store Search System!");
}

// This function keeps asking the user until a valid product is entered.
String getValidProduct(Map<String, int> products) {
  while (true) {
    stdout.write("Enter product to search: ");
    String item = stdin.readLineSync()!;

    if (searchProduct(products, item)) {
      return products.keys.firstWhere(
        (product) => product.toLowerCase() == item.toLowerCase(),
      );
    } else {
      print("❌ '$item' is not available in the store.");
      print("Please enter another product.\n");
    }
  }
}

bool searchProduct(Map<String, int> products, String item) {
  int i = 0;
  List<String> productNames = products.keys.toList();

  while (i < productNames.length) {
    if (productNames[i].toLowerCase() == item.toLowerCase()) {
      return true;
    }
    i++;
  }

  return false;
}
