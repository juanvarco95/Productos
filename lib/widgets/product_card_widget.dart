import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key, required this.products}) : super(key: key);
  final Products products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: _BackgrondBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(
              image: products.image,
            ),
            _BottomBanner(products.name, products.id!),
            Positioned(
              top: 0,
              right: 0,
              child: _UpBanner(price: products.price),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable(available: products.available))
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BoxDecoration _BackgrondBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, blurRadius: 20, offset: Offset(5, 10))
          ]);
}

class _NotAvailable extends StatelessWidget {
  final bool available;

  const _NotAvailable({Key? key, required this.available}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (available) return Container();

    return Container(
      width: 150,
      height: 80,
      decoration: _boxNotAvailable(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.center,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'No Disponible',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }

  BoxDecoration _boxNotAvailable() => const BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25), topLeft: Radius.circular(25)));
}

class _UpBanner extends StatelessWidget {
  final double price;

  const _UpBanner({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: _boxUpBanner(),
      child: Container(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              '$price',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  BoxDecoration _boxUpBanner() => const BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _BottomBanner extends StatelessWidget {
  const _BottomBanner(this.name, this.id);
  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: Container(
        width: double.infinity,
        height: 100,
        // color: Colors.red,
        decoration: _boxBottomBanner(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                id,
                style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxBottomBanner() {
    return const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({Key? key, this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      // decoration: _BoxBackgroundImage(),
      height: 400,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(image!),
        ),
      ),
    );
  }
}
