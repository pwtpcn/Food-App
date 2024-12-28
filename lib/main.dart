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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            const SearchBar(leading: Icon(Icons.search)),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 682,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 139, 216, 208),
                  borderRadius: BorderRadius.only(
                      topLeft: (Radius.circular(20)),
                      topRight: (Radius.circular(20)))),
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductBox(
                          name: "Omelette", price: 60, image: "omelette.jpg"),
                      ProductBox(name: "Pizza", price: 120, image: "pizza.jpg"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductBox(
                          name: "Salmon Roll", price: 60, image: "salmon.jpg"),
                      ProductBox(
                          name: "Cabonara", price: 60, image: "cabonara.jpg")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductBox(
                          name: "Pancake", price: 60, image: "pancake.jpg"),
                      ProductBox(
                          name: "Chocolate Cake",
                          price: 60,
                          image: "chocolateCake.jpg"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductBox(
                          name: "Spaghetti Bolonese",
                          price: 60,
                          image: "bolonese.jpeg"),
                      ProductBox(
                          name: "Pad Thai", price: 60, image: "padthai.jpg"),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String name;
  final int price;
  final String image;

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
                  "assets/images/" + image,
                  width: 180,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("$price฿"),
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

