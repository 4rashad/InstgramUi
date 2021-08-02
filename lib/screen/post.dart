import 'package:flutter/material.dart';
import 'package:instgramui/main.dart';
import 'package:instgramui/model/listo.dart';
import 'package:instgramui/screen/story.dart';

class Posted extends StatelessWidget {
  const Posted({Key? key, this.leftName = " ", this.index = 0})
      : super(key: key);
  final String leftName;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black12, width: 0.3)),
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Story(
                imgUrl: stories[index]["img"],
                size: 17,
                leftName: leftName,
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 400,
                ),
              ),
              MyiconButton(
                icon: Icons.more_vert_outlined,
                onTap: () {},
              ),
            ],
          ),
          Expanded(
              flex: 1,
              child: Image.network(
                stories[index]["img"],
                fit: BoxFit.fitWidth,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )),
          Row(children: [
            IconButton(
              icon: const Icon(Icons.favorite_border_rounded),
              onPressed: () {},
            ),
            Expanded(
                flex: 1,
                child: MyiconButton(
                  size: 22,
                  icon: Icons.comment_bank_outlined,
                  onTap: () {},
                )),
            Expanded(
                flex: 1,
                child: MyiconButton(
                  size: 22,
                  icon: Icons.send_outlined,
                  onTap: () {},
                )),
            const SizedBox(
              width: 200,
            ),
            Expanded(
                flex: 1,
                child: MyiconButton(
                  size: 22,
                  icon: Icons.turned_in_not,
                  onTap: () {},
                )),
          ]),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "3 likes ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("name: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("hello it my user page @dady"),
                  ],
                ),
                const Text("view all comments"),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
