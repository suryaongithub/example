import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ExampleHomepage(),
    );
  }
}

class ExampleHomepage extends StatelessWidget {
  ExampleHomepage({super.key});

  final GCColorSchema colorSchema =
      GCColorSchema(shadowColor: const Color.fromRGBO(211, 78, 78, 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 231, 178, 1),
        body: Center(
            child: GCCard(
          colorScheme: colorSchema,
          functionPressed: () {},
          height: 350,
          width: 125,
          child: const Placeholder(),
        )));
  }
}
