import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog_app_3/gen/assets.gen.dart';
import 'package:tech_blog_app_3/models/fake_data.dart';
import 'package:tech_blog_app_3/component/my_colors.dart';
import 'package:tech_blog_app_3/component/my_component.dart';
import 'package:tech_blog_app_3/component/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techbot.path,
                    height: size.height / 6.80,
                    width: size.width / 3.56,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyStrings.emailIsOk,
                    style: textTheme.headline4,
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.selectYourFavorites,
                    style: textTheme.headline4,
                  ),

                  // tagelist
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                          //
                          // برای اینکه اگر تعداد آیتم بالا باشد آیتم ها در هم نشوند و و بتوان  آیتم ها را اسکرول کرد
                          physics: const ClampingScrollPhysics(),
                          itemCount: tagList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.3,
                          ),
                          itemBuilder: ((context, index) {
                            return InkWell(
                                onTap: (() {
                                  setState(() {
                                    if (!selectedTagesList
                                        .contains(tagList[index])) {
                                      selectedTagesList.add(tagList[index]);
                                    } else {
                                      print("${tagList[index].title}  exist");
                                    }
                                  });
                                }),
                                child: MainTags(
                                    textTheme: textTheme, index: index));
                          })),
                    ),
                  ),

                  //
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    Assets.icons.down_cat_arrow.path,
                    scale: 3,
                  ),

                  //
                  // selected Tges List
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                          //
                          // برای اینکه اگر تعداد آیتم بالا باشد آیتم ها در هم نشوند و و بتوان  آیتم ها را اسکرول کرد
                          physics: const ClampingScrollPhysics(),
                          itemCount: selectedTagesList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.2,
                          ),
                          itemBuilder: ((context, index) {
                            return Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  color: SolidColors.surfaceColor,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(selectedTagesList[index].title,
                                          style: textTheme.headline4),

                                      // delete icon
                                      InkWell(
                                        onTap: (() {
                                          setState(() {
                                            selectedTagesList.removeAt(index);
                                          });
                                        }),
                                        child: const Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
