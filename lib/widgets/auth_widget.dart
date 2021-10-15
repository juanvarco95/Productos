import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          width: double.infinity,
          height: double.infinity,
          // color: Colors.white,
        ),
        _PurpleBackground(),
        _IconBackground(),
        child,
      ],
      // child: Container(width: 100, height: 100, color: Colors.amber),
    );
  }
}

class _IconBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
        width: double.infinity,
        height: 300,
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ));
  }
}

class _PurpleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _boxDecorationPurple(),
      child: Stack(
        children: [
          Positioned(
            child: _circle(),
            top: 10,
            left: 55,
          ),
          Positioned(
            child: _circle(),
            top: 50,
            left: 255,
          ),
          Positioned(
            child: _circle(),
            top: 170,
            left: 20,
          ),
          Positioned(
            child: _circle(),
            bottom: 50,
            right: 55,
          ),
          Positioned(
            child: _circle(),
            bottom: 50,
            right: 255,
          ),
        ],
      ),
    );
  }

  Container _circle() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.1)),
    );
  }

  BoxDecoration _boxDecorationPurple() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ]));
}
