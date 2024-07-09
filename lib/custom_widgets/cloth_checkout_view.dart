import 'package:flutter/material.dart';

import '../models/cloth.dart';

class ClothCheckoutView extends StatelessWidget {
  Cloth cloth;

  ClothCheckoutView({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(cloth.imagePath),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cloth.name,
                        style: TextStyle(
                          color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Size: ${cloth.size}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${cloth.price - (cloth.price * cloth.discount / 100)}',
                            style: TextStyle(
                                color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          (cloth.discount != 0)
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    '\$${cloth.price}',
                                    style: const TextStyle(
                                      decorationColor: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'x1',
              style: TextStyle(
                color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}
