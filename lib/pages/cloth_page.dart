import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/custom_widgets/size_chips.dart';
import 'package:yellow/models/head_wear.dart';
import 'package:yellow/models/trousers.dart';
import 'package:yellow/models/tshirts.dart';
import 'package:yellow/provider/app_provider.dart';

import '../models/cloth.dart';
import 'cart_page.dart';

class ClothPage extends StatefulWidget {
  Cloth cloth;
  static final String routeName = 'cloth';

  ClothPage({super.key, required this.cloth});

  @override
  State<ClothPage> createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false).size = '';
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.white
          : Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: (Theme.of(context).brightness == Brightness.light)
                    ? Colors.black
                    : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(Icons.arrow_back_ios_outlined,
                                  color: Colors.black),
                            ),
                          ),
                          const Text(
                            'Details',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey[200]),
                                child: IconButton(
                                  onPressed: () {
                                    context.goNamed(CartPage.routeName);
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              (appProvider.shoppingCart.isNotEmpty)
                                  ? CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 7,
                                child: Text(
                                  '${appProvider.shoppingCart.length}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 50),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(widget.cloth.imagePath),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              left: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber[200],
                                  foregroundColor: Colors.white,
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -30,
                              left: 120,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: widget.cloth.color.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          )),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            widget.cloth.color[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cloth.name,
                                  style: TextStyle(
                                      color: (Theme.of(context).brightness ==
                                              Brightness.light)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  widget.cloth.description,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  '\$${widget.cloth.price - (widget.cloth.price*widget.cloth.discount/100)}',
                                  style: TextStyle(
                                    color: (Theme.of(context).brightness ==
                                            Brightness.light)
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              (widget.cloth.discount!=0)? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                child: Text(
                                  '\$${widget.cloth.price}',
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              color: (Theme.of(context).brightness == Brightness.light)
                  ? Colors.black
                  : Colors.white,
              child: Column(
                children: [
                  Text(
                    'Select Your Size',
                    style: TextStyle(
                      color: (Theme.of(context).brightness == Brightness.light)
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  (widget.cloth is HeadWear)
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'There is no sizes for this piece',
                            style: TextStyle(
                                color: (Theme.of(context).brightness ==
                                        Brightness.light)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      : (widget.cloth is Tshirts)
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizeChips(label: 'S'),
                                  SizeChips(label: 'M'),
                                  SizeChips(label: 'L'),
                                  SizeChips(label: 'XL'),
                                ],
                              ),
                            )
                          : (widget.cloth is Trousers)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizeChips(label: 'S'),
                                      SizeChips(label: 'M'),
                                      SizeChips(label: 'L'),
                                      SizeChips(label: 'XL'),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizeChips(label: '38'),
                                      SizeChips(label: '40'),
                                      SizeChips(label: '41'),
                                      SizeChips(label: '42'),
                                    ],
                                  ),
                                ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    widget.cloth.size =
                        Provider.of<AppProvider>(context, listen: false).size;
                    Provider.of<AppProvider>(context, listen: false)
                        .addToShoppingCart(widget.cloth);
                    context.pop();
                  },
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
