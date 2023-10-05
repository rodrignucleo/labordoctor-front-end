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
        title: const Text('Labor Doctor'),
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
                  'https://s2-techtudo.glbimg.com/3JBdxyWrTEODOvrw0do8Qlmm9sA=/0x0:1200x700/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2023/B/d/bFXBYbRjumyOVCUwCpaw/the-good-doctor.jpg'),
              fit: BoxFit.cover),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 100.0, left: 20, right: 5),
          child: Text('Bem Vindo',
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
