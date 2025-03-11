import 'package:flutter/material.dart';

import 'design_pattern_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Design Patterns"),
        ),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemCount: DesignPatternType.values.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DesignPatternScreen(
                    designPatternType: DesignPatternType.values[index]),
              ),
            ),
            child: designPatternCard(
              DesignPatternType.values[index].fName,
            ),
          ),
        ));
  }
}

Widget designPatternCard(String title) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
    ),
    padding: EdgeInsets.all(20),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
