import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:visitour/travel_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelPage(),
      theme: ThemeData(
          primaryColor: Colors.orange,
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.purple)),
      debugShowCheckedModeBanner: false,
    );
  }
}
