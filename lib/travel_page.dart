import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  final image = 'https://avatars.githubusercontent.com/u/85099922?v=4';
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        // menu icon

        backgroundColor: Colors.transparent,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16, top: 16),
        elevation: 0.0,
      ),
      body: VStack([
        VxBox(
                child: [
          VxBox()
              .square(100)
              .roundedFull
              .neumorphic(
                color: Vx.purple500,
                elevation: 30,
              )
              .bgImage(DecorationImage(image: NetworkImage(image)))
              .make(),
          "Hi, "
              .richText
              .withTextSpanChildren(["Jaspreet".textSpan.bold.make()])
              .white
              .xl2
              .make()
              .p8(),
          "Tech Enthusiast".text.white.make(),
          VxTextField(
            borderType: VxTextFieldBorderType.none,
            borderRadius: 18,
            hint: "Search",
            autofocus: false,
            contentPaddingTop: 13,
            fillColor: Vx.gray200.withOpacity(0.3),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
              .customTheme(
                  themeData: ThemeData(
                brightness: Brightness.dark,
              ))
              .cornerRadius(10)
              .p16()
        ].vStack())
            .makeCentered()
            .h32(context),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: VxBox(
            child: VStack([
              TabBar(
                controller: tabController,
                indicatorColor: Colors.purple,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Vx.purple500,
                unselectedLabelColor: Vx.gray400,
                labelPadding: Vx.m16,
                tabs: [
                  Icon(
                    Icons.map,
                    size: 30,
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 30,
                  ),
                  Icon(
                    Icons.restaurant,
                    size: 30,
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                ],
              ),
              TabBarView(
                children: ["1", "2", "3", "4"]
                    .map((e) => VStack([
                          "Discover Places in London"
                              .text
                              .gray600
                              .xl2
                              .bold
                              .make(),
                          HStack([
                            Image.network(image)
                                .wh(context.percentWidth * 35, 100)
                                .cornerRadius(10),
                            20.widthBox,
                            VStack(
                              [
                                "Tower Bridge".text.semiBold.make(),
                                3.heightBox,
                                "Southwork".text.make().shimmer(),
                                5.heightBox,
                                HStack([
                                  VxRating(
                                    onRatingUpdate: (value) {},
                                    size: 13,
                                  ),
                                  5.heightBox,
                                  "(100)".text.xs.gray600.make(),
                                ])
                              ],
                              crossAlignment: CrossAxisAlignment.start,
                            ).expand()
                          ]).cornerRadius(8).backgroundColor(Vx.gray200)
                        ]).p16())
                    .toList(),
                controller: tabController,
              ).expand()
            ]),
          ).white.make(),
        ).expand(),
      ]),
    );
  }
}
