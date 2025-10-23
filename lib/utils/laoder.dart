import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Image(image: AssetImage("assets/images/loader.png"),height: 30,width: 30,),
    );
  }
}