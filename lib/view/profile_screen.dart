import 'package:flutter/material.dart';
import 'package:tech_blog_app_3/gen/assets.gen.dart';
import 'package:tech_blog_app_3/component/my_colors.dart';
import 'package:tech_blog_app_3/component/my_strings.dart';
// import '../models/fake_data.dart';
import 'package:tech_blog_app_3/component/my_component.dart';

// ignore: camel_case_types
class profileScreen extends StatelessWidget {
  const profileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Assets.images.avatar.path),
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),

            // blue pen Icon => Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.bluepen,
                  color: SolidColors.titleandseeColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdite,
                  style: textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),

            // name => Text
            Text(
              "امیری",
              style: textTheme.headline4,
            ),

            // email address => Text
            Text(
              "amiri@gmail.com",
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),

            // tech Divider  => (import) my_component.dart (1)
            TechDivider(size: size),
            // myFavoriteBlogs => Inkwell (1)
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavoriteBlogs,
                      style: textTheme.headline4,
                    ),
                  )),
            ),

            // tech Divider  => (import) my_component.dart (2)
            TechDivider(size: size),
            // myFavoriteBlogs => Inkwell (2)
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.myFavoritePodcasts,
                      style: textTheme.headline4,
                    ),
                  )),
            ),

            // tech Divider  => (import) my_component.dart (3)
            TechDivider(size: size),
            // myFavoriteBlogs => Inkwell (3)
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      MyStrings.logOut,
                      style: textTheme.headline4,
                    ),
                  )),
            ),

            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
