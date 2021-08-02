import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story(
      {Key? key,
      required this.imgUrl,
      this.size = 33,
      this.downName = " ",
      this.leftName = " "})
      : super(key: key);
  final String imgUrl;
  final double? size;
  final String downName;
  final String leftName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              key: UniqueKey(),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: size,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
              padding: const EdgeInsets.all(2), //width of border
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Colors.pink,
                    Colors.pinkAccent,
                    Colors.yellowAccent
                  ])),
            ),
            Text(
              downName,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              leftName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(leftName),
            const Text(""),
          ],
        ),
      ],
    );
  }
}
