import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_app_3/gen/assets.gen.dart';
import 'package:tech_blog_app_3/my_colors.dart';

import 'models/fake_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;

    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.menu),
                    Image(
                      image: Image.asset(Assets.images.logo.path).image,
                      height: size.height / 13.6,
                    ),
                    const Icon(Icons.search),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                // Stack
                Stack(
                  children: [
                    Container(
                      width: size.width / 1.25,
                      height: size.height /
                          4.2, // TODO: +> 13.6  or 4.2 ?  dorost va baad pak shavad?
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: AssetImage(homePagePosterMap["imageAsset"]),
                            fit: BoxFit.cover),
                      ),

                      foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                          colors: GradiantColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,

                      // column
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homePagePosterMap["writer"] +
                                    " - " +
                                    homePagePosterMap["date"],
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(homePagePosterMap["view"],
                                      style: textTheme.subtitle1),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            homePagePosterMap["title"],
                            style: textTheme.headline1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 16,
                ),

                // tag list
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 8, index == 0 ? bodyMargin : 15, 8),
                          child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
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
                                    Text(tagList[index].title,
                                        style: textTheme.headline2),
                                  ],
                                ),
                              )),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
