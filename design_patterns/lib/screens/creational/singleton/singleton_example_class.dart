// ensures class has only one instance and provides a global point of access to that instance.
// is useful when only one object of a class is needed in an entire application.

class SingletonExampleClass {
  //private static instance
  static SingletonExampleClass? _instance;

  // private constructor to prevent instantiation outside class
  SingletonExampleClass._internal();

  // factory constructor to return instance
  // if already created, return existing instance else create new instance
  factory SingletonExampleClass() {
    _instance ??= SingletonExampleClass._internal();
    return _instance!;
  }

  // example properties

  String? name;
  int? age;

  // example methods
  String introduction() {
    return "Hello, this is ${name ?? "......"}. I am ${age ?? "......"} years old.";
  }
}
