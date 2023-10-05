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
                  'https://img.freepik.com/free-photo/i-trying-be-best-doctor_329181-2188.jpg?w=740&t=st=1696469160~exp=1696469760~hmac=d01b0534e79d230d44d56266bc70a2923fb427f8d19ff907ee36168c48396e19'),
              fit: BoxFit.cover),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 100.0, left: 20, right: 5),
          child: Text('Labor Doctor',
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
