import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/ui/input_decoration.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products product =
        ModalRoute.of(context)!.settings.arguments as Products;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(children: [
                _ProductCard(image: product.image!),
                Positioned(
                  top: 50,
                  left: 30,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
                Positioned(
                  top: 50,
                  right: 30,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ]),
              const _ProductForm(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: double.infinity,
        // height: 300,
        decoration: _buildBoxDecoration(),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: _form(),
            )
          ],
        ),
      ),
    );
  }

  Form _form() => Form(
          child: Column(
        children: [
          TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', helperText: 'Producto')),
          const SizedBox(height: 30),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'Precio del Producto', helperText: 'Valor'),
          ),
          SwitchListTile.adaptive(
              value: true,
              activeColor: Colors.teal,
              title: const Text('Disponible'),
              onChanged: (value) {})
        ],
      ));

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45)));
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: 500,
          decoration: _buildBoxDecoration(),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)));
  }
}
