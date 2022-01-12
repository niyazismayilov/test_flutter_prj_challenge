import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:test_prj/providers/horizontal_items.dart';
import 'package:test_prj/providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final horizontalItems = context.watch<HorizontalItemsProvider>();
    final verticalItems = context.watch<VerticalItemsProvider>();

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            'assets/images/ic_close.png',
                            scale: 2,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 16.0),
                  child: Text("Section 1 (${horizontalItems.itemsCount})",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700)),
                ),
                Container(
                  height: height * 0.21,
                  margin: const EdgeInsets.only(left: 9),
                  width: width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: HorizontalItemsProvider().itemsCount, //int
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 10 : 8, right: 16),
                          child: Container(
                            width: width / 1.15,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 8.0,
                                  spreadRadius: 1.0,
                                  // offset: Offset(2.0, 2.0), //
                                )
                              ],
                            ),
                            child: Center(
                                child: Text(
                                    horizontalItems.generateItemAt(index),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700))),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 16.0),
                  child: Text("Section 2 (${verticalItems.itemsCount})",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700)),
                ),
                Flexible(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      itemCount: verticalItems.itemsCount,
                      //int
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                              height: height * 0.17,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 6.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                      verticalItems.generateItemAt(index),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700)))),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
