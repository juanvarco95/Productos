// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products product =
        ModalRoute.of(context)!.settings.arguments as Products;

    return ChangeNotifierProvider(
        create: (_) => ProductFormProvider(product),
        child: _ProductScreenBody(product: product));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
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
    final productForm = Provider.of<ProductFormProvider>(context);

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
              child: _form(
                  productForm.product.available,
                  productForm.product.name,
                  productForm.product.price,
                  productForm
                      .updateAvailibility(productForm.product.available)),
            )
          ],
        ),
      ),
    );
  }

  Form _form(
    bool available,
    String name,
    double price,
    updateAvailibility,
  ) =>
      Form(
          child: Column(
        children: [
          TextFormField(
              initialValue: name,
              onChanged: (value) => name = value,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Hay muy pocos caracteres';
              },
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto', helperText: 'Producto')),
          const SizedBox(height: 30),
          TextFormField(
            initialValue: price.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
            ],
            onChanged: (value) {
              if (double.tryParse(value) == null) {
                price = 0;
              } else {
                price = double.parse(value);
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'Precio del Producto', helperText: 'Valor'),
          ),
          SwitchListTile.adaptive(
              value: available,
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
