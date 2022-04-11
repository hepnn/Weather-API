import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherui/providers/weather.dart';
import 'package:weatherui/screens/main_screen.dart';
import 'package:weatherui/widgets/main_stack.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Weather(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          primaryColor: const Color(0xff282434),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color.fromARGB(255, 255, 255, 255),
          ),
          cardColor: const Color(0xff887880),
        ),
        home: const MainStack(),
      ),
    );
  }
}
