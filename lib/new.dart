import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Menu'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(name: "Omelette", price: 60, image: "omelette.jpg"),
      Product(name: "Pizza", price: 120, image: "pizza.jpg"),
      Product(name: "Salmon Roll", price: 60, image: "salmon.jpg"),
      Product(name: "Cabonara", price: 60, image: "cabonara.jpg"),
      Product(name: "Pancake", price: 60, image: "pancake.jpg"),
      Product(name: "Chocolate Cake", price: 60, image: "chocolateCake.jpg"),
      Product(name: "Spaghetti Bolonese", price: 60, image: "bolonese.jpeg"),
      Product(name: "Pad Thai", price: 60, image: "padthai.jpg"),
      Product(name: "Pad Thai", price: 60, image: "padthai.jpg"),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          const SearchBar(leading: Icon(Icons.search)),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 139, 216, 208),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: (products.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final int firstIndex = index * 2;
                  final int secondIndex = firstIndex + 1;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: ProductBox(product: products[firstIndex])),
                      if (secondIndex < products.length) ...[
                        const SizedBox(width: 8),
                        Expanded(child: ProductBox(product: products[secondIndex])),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/" + product.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${product.price}฿"),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  // Add functionality to handle favorite action here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class ProductBox extends StatelessWidget {
//   const ProductBox({Key? key, required this.product}) : super(key: key);

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 150, // Set height explicitly
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//                 child: Image.asset(
//                   "assets/images/" + product.image,
//                   width: double.infinity, // Ensure it spans the width
//                   fit: BoxFit.cover, // Makes the image fit neatly in the space
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 product.name,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Text("${product.price}฿"),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.leading}) : super(key: key);

  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
