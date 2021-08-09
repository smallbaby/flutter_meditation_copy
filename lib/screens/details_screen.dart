import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_meditation/constants.dart';
import 'package:flutter_meditation/widgets/bottom_nav_bar.dart';
import 'package:flutter_meditation/widgets/search_input.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: kBlueColor,
              image: DecorationImage(
                image: AssetImage('assets/images/meditation_bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.05), // 将文字顶下去.
                  Text(
                    'Meditation',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3-10 MIN Course',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                        "It's a long road. When you face the world alone, no one reaches out a hand for you to hold.'"),
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: SearchBar(),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      SeassionCard(
                        seassionNum: 1,
                        isDone: true,
                      ),
                      SeassionCard(
                        seassionNum: 2,
                        isDone: false,
                      ),
                      SeassionCard(
                        seassionNum: 3,
                        isDone: false,
                      ),
                      SeassionCard(
                        seassionNum: 4,
                        isDone: false,
                      ),
                      SeassionCard(
                        seassionNum: 5,
                        isDone: false,
                      ),
                      SeassionCard(
                        seassionNum: 6,
                        isDone: false,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Meditation",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: constraint.maxWidth / 2 - 10,
        //padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13), // 圆角
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: kShadowColor,
            ),
          ], // 阴影
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 43,
                    decoration: BoxDecoration(
                      color: isDone ? kBlueColor : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: kBlueColor),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : kBlueColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Seassion $seassionNum",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
