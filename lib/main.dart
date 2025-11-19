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

  final GCColorSchema colorSchema = GCColorSchema();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GCCard(
      colorScheme: colorSchema,
      functionPressed: () {},
      height: 350,
      width: 125,
      child: const Placeholder(),
    ));
  }
}
