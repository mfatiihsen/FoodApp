import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String imageSrc;
  final String name;
  final int price;
  final Color textColor;
  final VoidCallback press;
  BottomContainer(
      {required this.imageSrc,
      required this.textColor,
      required this.price,
      required this.name,
      required this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xff3a3e3e),
              backgroundImage: NetworkImage(imageSrc),
            ),
            ListTile(
              leading: Text(
                name,
                style: TextStyle(fontSize: 20, color: textColor),
              ),
              trailing: Text(
                "\$ $price",
                style: TextStyle(fontSize: 16, color: textColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(Icons.star, size: 18, color: Colors.white),
                  Icon(Icons.star, size: 18, color: Colors.white),
                  Icon(Icons.star, size: 18, color: Colors.white),
                  Icon(Icons.star, size: 18, color: Colors.white),
                  Icon(Icons.star, size: 18, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
