import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/models/cloth.dart';
import 'package:yellow/pages/cloth_page.dart';
import 'package:yellow/provider/app_provider.dart';

class ClothView extends StatelessWidget {
  Cloth cloth;

  ClothView({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<AppProvider>(context,listen: false).chosenCloth = cloth;
        context.goNamed(ClothPage.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(cloth.imagePath), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cloth.name,
                style: TextStyle(
                  color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                cloth.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Text(
                    '\$${cloth.price - (cloth.price*cloth.discount)/100}',
                    style: TextStyle(
                      color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                (cloth.discount!=0)? Padding(
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
                ):const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
