import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color(0xFF5465FF);
const secondaryColor = Color(0xFF788BFF);
const black = Color(0x00000000);
const white = Color(0xFFFFFFFF);

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    systemNavigationBarColor: primaryColor,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Draggable',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _incrementCount = 2;
  int _draggedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Draggable',
              style: TextStyle(
                color: white.withOpacity(.8),
                fontSize: 46,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Draggable<int>(
              data: _incrementCount,
              feedback: Material(
                color: Colors.transparent,
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '+ ' + _incrementCount.toString(),
                    style: const TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              childWhenDragging: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: secondaryColor, width: 5),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '+ ' + _incrementCount.toString(),
                  style: const TextStyle(
                      color: primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 25),
            DragTarget<int>(
              onAccept: (data) => setState(() => _draggedCount += data),
              builder: (context, candidateData, rejectedData) =>
                  Container(
                width: 200,
                height: 200,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: black.withOpacity(.5),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _draggedCount.toString(),
                  style: TextStyle(
                    color: black.withOpacity(.5),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
