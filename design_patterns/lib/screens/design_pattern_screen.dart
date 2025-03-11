import 'package:flutter/material.dart';

import 'creational/singleton/singleton_pattern_screen.dart';

enum DesignPatternType {
  creational("Creational Design Patterns"),
  structural("Structural Design Patterns"),
  behavioral("Behavioral Design Patterns");

  const DesignPatternType(this.fName);

  final String fName;
}

class DesignPatternScreen extends StatelessWidget {
  const DesignPatternScreen({super.key, required this.designPatternType});

  final DesignPatternType designPatternType;

  @override
  Widget build(BuildContext context) {
    final patternSubTypes = designPatternType == DesignPatternType.creational
        ? creationalDesignPatternTypes
        : designPatternType == DesignPatternType.structural
            ? structuralDesignPatternTypes
            : behavioralDesignPatternTypes;
    return Scaffold(
      appBar: AppBar(
        title: Text(designPatternType.fName),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: patternSubTypes.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () =>
              navigateToDesignPatternScreen(patternSubTypes[index], context),
          child: Text(
            patternSubTypes[index],
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

void navigateToDesignPatternScreen(
    String designPatternSubtypeName, BuildContext context) {
  SingletonPatternScreen? screen;

  switch (designPatternSubtypeName) {
    case "Singleton":
      screen = const SingletonPatternScreen();
      break;
    // case "Factory":
    //   screen = const FactoryPatternScreen();
    //   break;
    // case "Abstract Factory":
    //   screen = const AbstractFactoryPatternScreen();
    //   break;
    // case "Builder":
    //   screen = const BuilderPatternScreen();
    //   break;
    // case "Prototype":
    //   screen = const PrototypePatternScreen();
    //   break;
    // case "Adapter":
    //   screen = const AdapterPatternScreen();
    //   break;
    // case "Bridge":
    //   screen = const BridgePatternScreen();
    //   break;
    // case "Composite":
    //   screen = const CompositePatternScreen();
    //   break;
    // case "Decorator":
    //   screen = const DecoratorPatternScreen();
    //   break;
    // case "Facade":
    //   screen = const FacadePatternScreen();
    //   break;
    // case "Flyweight":
    //   screen = const FlyweightPatternScreen();
    //   break;
    // case "Proxy":
    //   screen = const ProxyPatternScreen();
    //   break;
    // case "Chain of Responsibility":
    //   screen = const ChainOfResponsibilityPatternScreen();
    //   break;
    // case "Command":
    //   screen = const CommandPatternScreen();
    //   break;
    // case "Interpreter":
    //   screen = const InterpreterPatternScreen();
    //   break;
    // case "Iterator":
    //   screen = const IteratorPatternScreen();
    //   break;
    // case "Mediator":
    //   screen = const MediatorPatternScreen();
    //   break;
    // case "Memento":
    //   screen = const MementoPatternScreen();
    //   break;
    // case "Observer":
    //   screen = const ObserverPatternScreen();
    //   break;
    // case "State":
    //   screen = const StatePatternScreen();
    //   break;
    // case "Strategy":
    //   screen = const StrategyPatternScreen();
    //   break;
    // case "Template Method":
    //   screen = const TemplateMethodPatternScreen();
    //   break;
    // case "Visitor":
    //   screen = const VisitorPatternScreen();
    //   break;
    default:
      debugPrint("Invalid design pattern subtype: $designPatternSubtypeName");
      break;
  }

  if (screen == null) return;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen!,
    ),
  );
}

List<String> creationalDesignPatternTypes = [
  "Singleton",
  "Factory",
  "Abstract Factory",
  "Builder",
  "Prototype",
];

List<String> structuralDesignPatternTypes = [
  "Adapter",
  "Bridge",
  "Composite",
  "Decorator",
  "Facade",
  "Flyweight",
  "Proxy",
];

List<String> behavioralDesignPatternTypes = [
  "Chain of Responsibility",
  "Command",
  "Interpreter",
  "Iterator",
  "Mediator",
  "Memento",
  "Observer",
  "State",
  "Strategy",
  "Template Method",
  "Visitor",
];
