import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMediaScreen extends StatelessWidget {
  static const String route = '/show_media';

  const ShowMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawMaterialButton(
                    onPressed: null,
                    elevation: 2.0,
                    hoverColor: const Color(0xffE3E9ED),
                    fillColor: const Color(0xffECF1F6).withOpacity(0.7),
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'Movie Detail',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  RawMaterialButton(
                    onPressed: null,
                    elevation: 2.0,
                    fillColor: const Color(0xffECF1F6).withOpacity(0.1),
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      CupertinoIcons.bookmark,
                      color: Colors.black,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 300,
                width: 224.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/items/item.png'),
                        scale: 3),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff7B7B7B).withOpacity(0.25),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ])),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 16),
                  child: Text(
                    'Luck',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: SizedBox(
                    height: 17,
                    width: 292,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xff434E58),
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '17 Sep 2021',
                              style: TextStyle(
                                  color: Color(0xff78828A), fontSize: 12),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              CupertinoIcons.time_solid,
                              color: Color(0xff434E58),
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '148 Minutes',
                              style: TextStyle(
                                  color: Color(0xff78828A), fontSize: 12),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.local_movies,
                              color: Color(0xff434E58),
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Action',
                                style: TextStyle(
                                    color: Color(0xff78828A), fontSize: 12),
                                textAlign: TextAlign.center)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                  width: 104,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(CupertinoIcons.star_fill,
                          size: 16, color: Color(0xffFACC15)),
                      Icon(CupertinoIcons.star_fill,
                          size: 16, color: Color(0xffFACC15)),
                      Icon(CupertinoIcons.star_fill,
                          size: 16, color: Color(0xffFACC15)),
                      Icon(CupertinoIcons.star_fill,
                          size: 16, color: Color(0xffFACC15)),
                      Icon(CupertinoIcons.star_fill,
                          size: 16, color: Color(0xff78828A)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Description',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff111111)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
                        's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.Show More',
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(color: Color(0xff78828A), fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
