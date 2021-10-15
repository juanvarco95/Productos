import 'package:flutter/material.dart';

class CardLoginWidget extends StatelessWidget {
  const CardLoginWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 220, horizontal: 30),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // height: 300,
            // color: Colors.white,
            decoration: _boxLogin(),
            child: child),
      ),
    );
  }

  BoxDecoration _boxLogin() => BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black87, blurRadius: 15),
        ],
        borderRadius: BorderRadius.circular(30),
      );
}
