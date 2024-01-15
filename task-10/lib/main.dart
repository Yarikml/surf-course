import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  double? xOffset;
  double? yOffset;

  Color color = Colors.deepOrange;

  Color get generatedColor => Color.fromRGBO(math.Random().nextInt(255),
      math.Random().nextInt(255), math.Random().nextInt(255), 1);

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width - 60;
    final maxHeight = MediaQuery.of(context).size.height - 60;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned(
                left: xOffset,
                top: yOffset,
                child: RotationTransition(
                  turns: _animation,
                  child: Icon(
                    Icons.adb,
                    color: color,
                    size: 70,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Play with me',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )),
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      color = generatedColor;
                    });
                  },
                  onLongPress: () {
                    _controller.forward(from: 0.0);
                  },
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      if (details.localPosition.dx < maxWidth) {
                        xOffset = details.localPosition.dx;
                      }
                      yOffset = details.localPosition.dy;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
