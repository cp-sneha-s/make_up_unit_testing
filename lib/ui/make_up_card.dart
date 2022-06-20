import 'package:flutter/material.dart';
import 'package:make_up_flutter/viewmodel/cart_model.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';

class MakeUpcard extends StatelessWidget {
  const MakeUpcard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            product.image_link == null
                ? const Icon(Icons.person)
                : CircleAvatar(
              radius: 40,
              backgroundImage:
              NetworkImage(product.image_link!),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? "",
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  Text(
                    product.product_type ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                  Text(
                    '\$ ${product.price }',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            TextButton(onPressed: (){
              Provider.of<CartModel>(context,listen: false).addToCart(product);
            }, child: const Text('ADD',style:  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.pinkAccent),))
          ],
        ),
      ),
    );
  }
}


class CartMakeUpcard extends StatelessWidget {
  final Product product;
  const CartMakeUpcard({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            product.image_link == null
                ? const Icon(Icons.person)
                : CircleAvatar(
              radius: 40,
              backgroundImage:
              NetworkImage(product.image_link!),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? "",
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  Text(
                    product.product_type ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                  Text(
                    '\$ ${product.price }',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: (){
              Provider.of<CartModel>(context,listen: false).removeFromCart(product);
            }, icon:const Icon(Icons.delete,size: 30,color: Colors.pinkAccent,),
  )
          ],
        ),
      ),
    );
  }
}

