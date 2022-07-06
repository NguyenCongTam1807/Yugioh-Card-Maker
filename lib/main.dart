import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_card_maker/providers/card_provider.dart';
import 'package:yugioh_card_maker/screens/card_maker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(create: (ctx) => CardProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(813,1185),
        minTextAdapt: true,
        builder: (context, widget) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Yugioh Card Maker',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (ctx) => const MyHomePage(),

          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yugioh Card Maker'),
          actions: [
            AppBarButton(
              icon: Icons.save,
              text: 'Save',
              onPressed: () {},
            ),
            AppBarButton(
              icon: Icons.share,
              text: 'Share',
              onPressed: () {},
            ),
          ],
        ),
        body:
            CardMakerScreen(),
        //resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, required this.icon, required this.text, required this.onPressed}) : super(key: key);

  final IconData icon;
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
      onTap: () => onPressed,
    );
  }
}

