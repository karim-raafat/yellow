import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/pages/thank_you_page.dart';
import 'package:yellow/provider/app_provider.dart';

class CheckoutPage extends StatelessWidget {
  static final String routeName = 'checkout';

  const CheckoutPage({super.key});

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
        toolbarHeight: MediaQuery.of(context).size.height * 0.40,
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
                      left: 70,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Checkout',
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
                          'Checkout',
                          style: TextStyle(
                              color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.transparent,
                                child: ClipOval(
                                  child: Image.asset(
                                      appProvider.shoppingCart[0].imagePath),
                                ),
                              ),
                              (appProvider.shoppingCart.length>1)? Positioned(
                                left: 50,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: Image.asset(
                                        appProvider.shoppingCart[1].imagePath),
                                  ),
                                ),
                              ):const SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${appProvider.shoppingCart.length} Products',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '\$${appProvider.price} + Tax',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: (Theme.of(context).brightness ==
                                            Brightness.light)
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
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
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Housing Estate,Lan9,Apartment 25/3,Sylhet',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: (Theme.of(context).brightness == Brightness.light)
                  ? Colors.black
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text(
                        'Payment',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[800],
                          child: const Icon(Icons.credit_card,color: Colors.white,size: 35,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20
                          ),
                          child: Text('Card ends with ***9805',style: TextStyle(color: Colors.grey,),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey[800],
                            child: const Icon(Icons.delivery_dining,color: Colors.white,size: 35,),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20
                            ),
                            child: Text('Pay with Cash on Delivery',style: TextStyle(color: Colors.grey,),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
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
                                'Standarad - free',
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  context.goNamed(ThankYouPage.routeName);
                  appProvider.shoppingCart = [];
                  appProvider.size='';
                  appProvider.price=0;
                },
                child: const Text(
                  'Pay',
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
