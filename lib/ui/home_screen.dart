import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:make_up_flutter/services/api_service.dart';
import 'package:make_up_flutter/viewmodel/cart_model.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
import 'cart_screen.dart';
import 'make_up_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent.shade100,
          title: const Text(
            'Maybelline Products',
            style: TextStyle(fontSize: 23),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>const CartScreen()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
             Padding(
              padding:const EdgeInsets.only(top: 10.0, right: 10),
              child: Consumer<CartModel>(
                builder: (context,cartModel,_)=>
             Text(
                  cartModel.cartValue.toString(),
                  style:const TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
          centerTitle: true,
        ),
        body: FutureBuilder<List<Product>>(
          future: apiService.getProductList(Client()),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<Product> list = snapshot.data;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Product product = list[index];
                    return MakeUpcard(product: product);
                  });
            } else if (snapshot.hasError) {
              throw Exception('Failed to load data${snapshot.error}');
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.pink,
            ));
          },
        ),
      ),
    );
  }
}
