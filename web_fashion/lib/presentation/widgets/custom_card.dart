import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String price;
  final String pathImage;

  const CustomCard({
    Key? key,
    required this.title,
    required this.price,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final imageHeight = deviceWidth * 0.14;
    final contentHeight = deviceWidth * 0.08;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(imageHeight),
        _buildContent(contentHeight),
      ],
    );
  }

  Widget _buildImage(double height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: 230,
        height: height,
      ),
    );
  }

  Widget _buildContent(double height) {
    return Container(
      width: 230,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text('R\$ $price'),
          ],
        ),
      ),
    );
  }
}