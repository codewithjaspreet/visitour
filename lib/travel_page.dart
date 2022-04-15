import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  final image = 'https://avatars.githubusercontent.com/u/85099922?v=4';
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
      ]),
    );
  }
}
