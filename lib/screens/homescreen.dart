import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';

import '../Consts/color.dart';
import '../Widgets/widgets.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: getH(68), left: getW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Your Location",
                style: Widgets.textstyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getH(6), left: getW(119)),
              child: Row(
                children: [
                  const Text(
                    "Bandung, Cimahi",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: getW(8)),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            SizedBox(height: getH(20)),
            Container(
              height: getH(48),
              width: getW(374),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffF1F1F5)),
              child: Row(
                children: [
                  SizedBox(width: getW(30)),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(width: getW(10)),
                  const Text(
                    "Search anything here",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: getH(28)),
            ListTile(
              leading: Container(
                height: getH(44),
                width: getW(44),
                child: Image.asset("assets/images/kupon.png"),
              ),
              title: const Text(
                "You have 3 coupon",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                "Let’s use this coupon",
                style: Widgets.textstyle(),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            SizedBox(height: getH(25)),
            StreamBuilder(
                stream: _fireStore.collection("category").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
                  if (snap.hasData) {
                    var data = snap.data!.docs;
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Choose Category",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: getW(178)),
                            Text(
                              "See all",
                              style: Widgets.textstyle(),
                            )
                          ],
                        ),
                        SizedBox(height: getH(16)),
                        Container(
                          height: getH(134),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                height: getH(134),
                                width: getW(123),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colores.categoryColor[index],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: getH(20)),
                                    Container(
                                      height: getH(59),
                                      width: getW(72.86),
                                      color: Colors.red,
                                      child: Image.network(
                                        "${data[index]["fonimg"]}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: getH(14)),
                                    Text(
                                      "${data[index].id.toUpperCase()}",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: data.length,
                          ),
                        ),
                        SizedBox(height: getH(42)),
                        Row(
                          children: [
                            const Text(
                              "Best Selling",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: getW(225)),
                            Text(
                              "See all",
                              style: Widgets.textstyle(),
                            )
                          ],
                        ),
                        Container(
                          height: getH(340),
                          width: double.infinity,
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 5),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.8),
                            itemBuilder: (context, index) {
                              int random = Random().nextInt(3);
                              return Container(
                                height: getH(242),
                                margin: const EdgeInsets.all(10),
                                width: getW(196),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colores.categoryColor[random],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: getH(20), left: getW(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: getH(79),
                                        width: getW(97.67),
                                        color: Colors.red,
                                        child: Image.network(
                                          "${data[ random ]['img'][index]}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: getH(20)),
                                      Text(
                                        "${data[random ]['nomi'][index]}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: getH(4)),
                                      Text(
                                        "${data[random]['shop'][index]}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff696974),
                                        ),
                                      ),
                                      SizedBox(height: getH(20)),
                                      Row(
                                        children: [
                                          Text(
                                              "\$${data[random ]['price'][index]}/kg"),
                                          SizedBox(width: getW(40)),
                                          Container(
                                            height: getH(26),
                                            width: getW(36),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xff2ECC71),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: 6,
                          ),
                        )
                      ],
                    );
                  } else if (snap.hasError) {
                    return const Center(
                      child: Text("Serverda xato bor bratishka"),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                })
          ],
        ),
      ),
    );
  }
}
