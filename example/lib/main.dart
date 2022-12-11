import 'package:flutter/material.dart';
import 'package:flutter_custom_buttons/flutter_custom_buttons.dart';
import 'package:flutter_reusable_widgets/flutter_reusable_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedScaleButton(
              width: 240,
              label: 'SimpleSnackBar',
              onPressed: () {
                showSnackBar(context, const Text('SimpleSnackBar'));
              },
            ),
            const SizedBox(height: 24),
            AnimatedScaleButton(
              label: 'CustomSnackBar',
              width: 240,
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('CustomSnackBar'),
                  backgroundColor: Colors.amber,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(32.0),
                );
                showSnackBar(context, snackBar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
