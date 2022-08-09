// import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tech_blog_app_3/component/my_strings.dart';
import 'package:tech_blog_app_3/gen/assets.gen.dart';
import 'package:tech_blog_app_3/models/fake_data.dart';
import 'package:tech_blog_app_3/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.3,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// MyTags
class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            colors: GradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(
                Assets.icons.hashtag,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(tagList[index].title, style: textTheme.headline2),
            ],
          ),
        ));
  }
}

myLaunchUrl(String url) async {
  var urivar = Uri.parse(url);
  if (await canLaunchUrl(urivar)) {
    await launchUrl(urivar);
  } else {
    log("Oh! Probably there is a problem, I can't luanch ${urivar.toString()}!");
  }
}
