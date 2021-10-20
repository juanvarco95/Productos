import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'productScreen'),
                child: const ProductCardWidget(),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
