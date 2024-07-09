import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/custom_widgets/cloth_view.dart';
import 'package:yellow/custom_widgets/filter_chips.dart';
import 'package:yellow/models/cloth.dart';

import 'package:yellow/pages/cart_page.dart';
import 'package:yellow/pages/profile_page.dart';
import 'package:yellow/provider/app_provider.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/';

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    List<Cloth> results = appProvider.searchResults(searchController.text);
    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.white
          : Colors.black,
      appBar: AppBar(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200]),
                    child: IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.settings,
                          color:
                              (Theme.of(context).brightness == Brightness.light)
                                  ? Colors.black
                                  : Colors.black,
                        )),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
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
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[200]),
                        child: IconButton(
                          onPressed: () {
                            context.goNamed(ProfilePage.routeName);
                          },
                          icon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Hello! ',
                        style: TextStyle(color: Colors.grey, fontSize: 50),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.52,
                          child: Consumer<AppProvider>(
                            builder: (BuildContext context,
                                AppProvider appProvider, Widget? child) {
                              return Text(
                                appProvider.username.split(' ')[0],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: (Theme.of(context).brightness ==
                                            Brightness.light)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 50),
                              );
                            },
                          ))
                    ],
                  ),
                  const Text(
                    'Fashion is all about beauty',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: Colors.amber[200],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  searchController.text = value;
                  results = appProvider.searchResults(searchController.text);
                },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                    hintText: 'Search for clothes,pants,shoes,etc',
                    prefixIcon: const Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          context: context,
                          builder: (context) => SafeArea(
                            child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Filter',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sort by',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          child: ListView(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              FilterChips(label: 'Discounts'),
                                              FilterChips(label: 'Popular'),
                                              FilterChips(label: 'Trendy'),
                                              FilterChips(label: 'Recent'),
                                              FilterChips(
                                                  label: 'Best Selling'),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Divider(
                                            color: Colors.grey,
                                            thickness: 2,
                                          ),
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Categories',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          child: ListView(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              FilterChips(label: 'Men'),
                                              FilterChips(label: 'Women'),
                                              FilterChips(label: 'Unisex'),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Divider(
                                            color: Colors.grey,
                                            thickness: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.filter_alt,
                        color: Colors.black,
                      ),
                    )),
              ),
            ),
            Expanded(
              child: Card(
                color: (Theme.of(context).brightness == Brightness.light)
                    ? Colors.black
                    : Colors.white,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: Consumer<AppProvider>(
                            builder: (BuildContext context,
                                    AppProvider appProvider, Widget? child) =>
                                ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    appProvider.changeClothView('All');
                                  },
                                  child: Text(
                                    'ALL',
                                    style: TextStyle(
                                      color: (appProvider.clothView == 'All' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.light)
                                          ? Colors.white
                                          : (appProvider.clothView == 'All' &&
                                                  Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    appProvider.changeClothView('Tops');
                                  },
                                  child: Text(
                                    'TOPS',
                                    style: TextStyle(
                                      color: (appProvider.clothView == 'Tops' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.light)
                                          ? Colors.white
                                          : (appProvider.clothView == 'Tops' &&
                                                  Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    appProvider.changeClothView('Trousers');
                                  },
                                  child: Text(
                                    'TROUSERS',
                                    style: TextStyle(
                                      color: (appProvider.clothView ==
                                                  'Trousers' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.light)
                                          ? Colors.white
                                          : (appProvider.clothView ==
                                                      'Trousers' &&
                                                  Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    appProvider.changeClothView('Shoes');
                                  },
                                  child: Text(
                                    'SHOES',
                                    style: TextStyle(
                                      color: (appProvider.clothView ==
                                                  'Shoes' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.light)
                                          ? Colors.white
                                          : (appProvider.clothView == 'Shoes' &&
                                                  Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    appProvider.changeClothView('Accessories');
                                  },
                                  child: Text(
                                    'ACCESSORIES',
                                    style: TextStyle(
                                      color: (appProvider.clothView ==
                                                  'Accessories' &&
                                              Theme.of(context).brightness ==
                                                  Brightness.light)
                                          ? Colors.white
                                          : (appProvider.clothView ==
                                                      'Accessories' &&
                                                  Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
                                              ? Colors.black
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Consumer<AppProvider>(
                          builder: (BuildContext context,
                              AppProvider appProvider, Widget? child) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height * 0.37,
                                crossAxisCount: 2,
                              ),
                              itemCount: results.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ClothView(
                                cloth: results[index],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
