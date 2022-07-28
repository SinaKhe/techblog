import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog_app_3/gen/assets.gen.dart';
import 'package:tech_blog_app_3/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.techbot.path,
            height: size.height / 6.80,
            width: size.width / 3.56,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.wlcShSu, style: textTheme.headline4)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, size, textTheme);
              },
              child: const Text(
                "بزن بریم",
              ),
            ),
          ),
        ],
      )),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmale = RegExp('^[a-z-0-9]+@');

    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          // return Container()
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.plsInsertEmail,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        // TODO: print(value + " is Email = " + isEmale.hasMatch(value).toString());
                      },
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "techblog@gmail.com",
                        hintStyle: textTheme.headline5,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (() {}), child: const Text("ادامه")),
                ],
              )),
            ),
          );
        }));
  }
}
