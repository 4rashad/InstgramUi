import 'package:fluttericon/octicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:instgramui/model/listo.dart';
import 'package:instgramui/screen/post.dart';
import 'package:instgramui/screen/story.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Instgram(),
    ),
  );
}

ScrollController? controlleri;

class Instgram extends StatefulWidget {
  const Instgram({Key? key}) : super(key: key);

  @override
  _InstgramState createState() => _InstgramState();
}

class _InstgramState extends State<Instgram> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        home: Material(
          child: SafeArea(
            child: Scaffold(
                bottomNavigationBar: const BouttomNavig(),
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Instgram",
                          style: GoogleFonts.lobster(
                              fontSize: 33.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          width: 160,
                        ),
                        const IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.add_circle_outline_sharp,
                              color: Colors.black,
                            )),
                        const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.facebook_rounded)),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        //   key: UniqueKey(),
                        //controller: controlleri,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                //  shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: stories.length,
                                itemBuilder:
                                    (BuildContext contextt, int index) => Story(
                                  imgUrl: stories[index]["img"],
                                  downName: stories[index]["name"].toString(),
                                ),
                              ),
                            ),
                            //post
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                // controller: controlleri,
                                shrinkWrap: true,
                                itemCount: stories.length,
                                itemBuilder:
                                    (BuildContext contextt, int index) =>
                                        Posted(
                                          index: index,
                                          leftName: stories[index]["name"],
                                        )),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}

class MyiconButton extends StatelessWidget {
  const MyiconButton(
      {Key? key, required this.icon, required this.onTap, this.size = 27})
      : super(key: key);
  final IconData icon;
  final Function() onTap;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: size,
        ));
  }
}

class BouttomNavig extends StatelessWidget {
  const BouttomNavig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: MyiconButton(
              icon: Icons.home_rounded,
              onTap: () {},
            )),
        Expanded(
            flex: 1,
            child: MyiconButton(
              size: 24,
              icon: Octicons.search,
              onTap: () {},
            )),
        Expanded(
            flex: 1,
            child: MyiconButton(
              icon: Icons.ondemand_video_rounded,
              onTap: () {},
            )),
        Expanded(
            flex: 1,
            child: MyiconButton(
              icon: Icons.favorite_border,
              onTap: () {},
            )),
        Expanded(
            flex: 1,
            child: MyiconButton(
              icon: Icons.circle,
              onTap: () {},
            )),
      ],
    );
  }
}
