import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/custom_widgets/cloth_checkout_view.dart';
import 'package:yellow/pages/checkout_page.dart';
import 'package:yellow/provider/app_provider.dart';

class CartPage extends StatelessWidget {
  static final String routeName = 'cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox(),
        backgroundColor: (Theme.of(context).brightness == Brightness.light)
            ? Colors.black
            : Colors.white,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300]),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 90,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Cart',
                          style: TextStyle(
                              color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                  ? Colors.white
                                  : Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'My Cart',
                          style: TextStyle(
                              color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        '${appProvider.shoppingCart.length} items in my cart',
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color:
                              (Theme.of(context).brightness == Brightness.light)
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Housing Estate,Lan9,Apartment 25/3,Sylhet',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'Change',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    (Theme.of(context).brightness ==
                                            Brightness.light)
                                        ? Colors.white
                                        : Colors.black,
                                color: (Theme.of(context).brightness ==
                                        Brightness.light)
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: (Theme.of(context).brightness == Brightness.light)
                    ? Colors.black
                    : Colors.white,
                child: SizedBox(
                  child: Column(
                    children: [
                      Consumer<AppProvider>(
                        builder: (BuildContext context, AppProvider appProvider,
                            Widget? child) {
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: appProvider.shoppingCart.length,
                              itemBuilder: (context, index) =>
                                  ClothCheckoutView(
                                cloth: appProvider.shoppingCart[index],
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Theme(
                          data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor: (Theme.of(context).brightness ==
                                      Brightness.light)
                                  ? Colors.grey[800]
                                  : Colors.blueGrey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                                hintText: 'Apply coupon code',
                                contentPadding: EdgeInsets.only(left: 100),
                                hintStyle: TextStyle(color: Colors.grey)),
                            cursorColor: Colors.amber[200],
                            onSubmitted: (value) {
                              appProvider.changeUserName(value);
                            },
                          ),
                        ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subtotal',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '${appProvider.price} US\$',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping fee',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Standard - free',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Estimated Total',
                          style: TextStyle(
                            color: (Theme.of(context).brightness ==
                                    Brightness.light)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text(
                          '${appProvider.price} US\$',
                          style: TextStyle(
                            color: (Theme.of(context).brightness ==
                                Brightness.light)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.07,
              decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  context.goNamed(CheckoutPage.routeName);
                },
                child: const Text(
                  'Go To Checkout',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
