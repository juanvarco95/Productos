import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decoration.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
                const _ProductCard(),
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
              child: _Form(),
            )
          ],
        ),
      ),
    );
  }

  Form _Form() => Form(
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          width: double.infinity,
          height: 500,
          decoration: _buildBoxDecoration(),
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://via.placeholder.com/400x300/green'),
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
