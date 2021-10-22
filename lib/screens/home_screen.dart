import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/products_service.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: productsService.products.length,
          itemBuilder: (BuildContext context, index) {
            final product = productsService.products;
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'productScreen',
                  arguments: product[index]),
              child: ProductCardWidget(
                products: productsService.products[index],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
