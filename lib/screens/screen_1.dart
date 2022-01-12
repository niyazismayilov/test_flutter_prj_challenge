import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/constant/Translate.dart';
import 'package:test_prj/constant/colors.dart';
import 'package:test_prj/constant/text_styles.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  _Screen1PageState createState() => _Screen1PageState();
}

class _Screen1PageState extends State<Screen1> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showResponsiveDialog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(),
    );
  }

  Future<void> _showResponsiveDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.all(7.51),
          title: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        Translate.title,
                        style: UITextStyle.titleStyle(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      child: Text(Translate.subTitle,
                          style: UITextStyle.subTitleStyle()),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/images/ic_close.png',scale:2)
                ),
              )
            ],
          ),
          content: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 16),
                  decoration: const BoxDecoration(color: Colors.grey),
                  height: MediaQuery.of(context).size.height * 0.44,
                  child: Scrollbar(
                    isAlwaysShown: Platform.isIOS,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: ListBody(
                        children: [
                          Container(
                            child: Text(Translate.body),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.05),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 18),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 12.0),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () {},
                      child: Text(Translate.buttonText,style:UITextStyle.subTitleStyle(color:ProjectColor.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
          ),
        );
      },
    );
  }
}
