import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yellow/provider/app_provider.dart';

class ProfilePage extends StatelessWidget {
  static final String routeName = 'profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    nameController.text = appProvider.username;
    emailController.text = appProvider.email;
    passwordController.text = appProvider.password;
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
                          color: Colors.black ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Profile Page',
                          style: TextStyle(color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black),
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
                          'Edit Your Profile',
                          style: TextStyle(
                              color: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Text(
                      'You can edit your profile from here',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: (Theme.of(context).brightness == Brightness.light)? Colors.black : Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              child: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 100,
                              ),
                              radius: 80,
                              backgroundColor: Colors.grey[200],
                            ),
                            Positioned(
                              bottom: -10,
                              right: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 4)),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.amber[200],
                                  child: Icon(
                                    Icons.mode_edit_outlined,
                                    color: (Theme.of(context).brightness == Brightness.light)?Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Theme(
                          data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.blueGrey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          child: TextField(
                            cursorColor: Colors.amber[200],
                            controller: nameController,
                            onSubmitted: (value){
                              appProvider.changeUserName(value);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Theme(
                          data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.blueGrey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(Icons.email_outlined)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Theme(
                          data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.blueGrey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month_outlined),
                              hintText: 'Date',
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Theme(
                          data: ThemeData(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor: (Theme.of(context).brightness == Brightness.light)? Colors.white : Colors.blueGrey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15
                              ),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          child: TextField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      context.pop();
                    },
                    child: const Text(
                      'Save Change',
                      style: TextStyle(color: Colors.black,fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
