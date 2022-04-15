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
  String img1 =
      'https://images.unsplash.com/photo-1543832923-44667a44c804?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=744&q=80';
  String img2 =
      'https://images.unsplash.com/photo-1588096344356-9b497caeeb64?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=484&q=80';
  late TabController tabController;

  double anim = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    // withAnimation(vsync: this, tween: Tween(begin: 1.0,end: 0.0), callBack: (animationVal,controllerVal){
    //   anim = animationVal;
    //   setState(() {
    //
    //   });
    // })
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
              .p8()
              .offset(offset: Offset(-300, anim * 0.0)),
          "Crazy Traveller".text.white.make(),
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
                    .map((e) => SingleChildScrollView(
                          child: VStack([
                            "Discover Places".text.gray600.xl2.bold.make(),
                            20.heightBox,
                            TravelCard(
                                title: "Golden Temple",
                                subtitle: 'Punjab',
                                img: img2),
                            15.heightBox,
                            TravelCard(
                                title: "Tower", subtitle: 'England', img: img1),
                          ]).p16(),
                        ))
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

class TravelCard extends StatelessWidget {
  late final String title, subtitle, img;

  TravelCard({required this.title, required this.subtitle, required this.img});
  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.network(
        img,
        fit: BoxFit.cover,
      ).wh(context.percentWidth * 35, 100).cornerRadius(10),
      20.widthBox,
      VStack(
        [
          title.text.semiBold.make(),
          3.heightBox,
          subtitle.text.make().shimmer(),
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
    ]).cornerRadius(8).backgroundColor(Vx.gray200);
  }
}
