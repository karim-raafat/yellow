import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yellow/pages/home_page.dart';

class ThankYouPage extends StatelessWidget {
  static final String routeName = 'thankYou';

  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: Colors.amber[200],
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thank you for using Yellow!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'You will be notified once your order is out for delivery!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(child: const Icon(Icons.emoji_emotions_outlined,color: Colors.grey,size: 300,),),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.amber[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),),
                      onPressed: () {
                        context.goNamed(HomePage.routeName);
                      },
                      child: const Text(
                        'Go Back Home',
                        style: TextStyle(color: Colors.black,fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
