import 'package:design_patterns/screens/creational/singleton/singleton_example_class.dart';
import 'package:flutter/material.dart';

class SingletonPatternScreen extends StatefulWidget {
  const SingletonPatternScreen({super.key});

  @override
  State<SingletonPatternScreen> createState() => _SingletonPatternScreenState();
}

class _SingletonPatternScreenState extends State<SingletonPatternScreen> {
  final singleton1 = SingletonExampleClass();
  final singleton2 = SingletonExampleClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Singleton Pattern Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Singleton1 :: ${singleton1.introduction()}"),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Singleton2 :: ${singleton2.introduction()}"),
              ),
            ),
            SizedBox(height: 16),
            Text(
                "Are Singleton1 and Singleton2 same instance? ${identical(singleton1, singleton2)}"),
            Text("Singleton1 hashCode ::=> ${singleton1.hashCode}"),
            Text("Singleton2 hashCode ::=> ${singleton2.hashCode}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //update singleton1
          singleton1.name = "Singleton1";
          singleton2.age = 30;

          //update the state after updating the data in singleton instance
          setState(() {});
        },
        label: Text("Update Singleton data"),
      ),
    );
  }
}
