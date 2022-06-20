import 'package:flutter/material.dart';
import 'package:make_up_flutter/ui/home_screen.dart';
import 'package:make_up_flutter/ui/make_up_card.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../viewmodel/cart_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartModel = Provider.of<CartModel>(context,listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent.shade100,
            title: const Text("CheckOut"),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Consumer<CartModel>(builder: (context, cartModel, _) {
                  List<Product> cartList = cartModel.cart;
                  return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        Product product = cartList[index];
                        return CartMakeUpcard(product: product);
                      });
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        cartModel.getPrice();
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text('Confirm Purchase',
                                    style: TextStyle(fontSize: 25)),
                                content: Text('\$ ${cartModel.price}',style: const TextStyle(fontSize: 20)),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel',
                                          style: TextStyle(fontSize: 20))),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen()));
                                        cartModel.setCart([]);
                                      },
                                      child: const Text(
                                        'Ok',
                                        style: TextStyle(fontSize: 20),
                                      ))
                                ],
                              );
                            });
                      },
                      child:  Text(' Confirm ',
                          style: TextStyle(fontSize: 25))),
                ),
              ),
            ],
          )),
    );
  }
}
