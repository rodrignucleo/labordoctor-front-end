import 'package:flutter/material.dart';

import '../../shared/widgets/drawpages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _homePage createState() => _homePage();
}

class _homePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem Vindo'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: const NetworkImage(
                  'https://i.pinimg.com/736x/a1/62/f4/a162f45c40af149da77113b69e8db4c3.jpg'),
              fit: BoxFit.cover),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 100.0, left: 20, right: 5),
          child: Text('Bem Vindo\nao\nLista Livros',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      drawer: DrawerPage.getWidget(context),
    );
  }
}
