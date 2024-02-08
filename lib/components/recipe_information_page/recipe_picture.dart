import 'package:flutter/material.dart';

class RecipePicture extends StatelessWidget {
  final String image;
  const RecipePicture({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.35,
      child: Image.network(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
