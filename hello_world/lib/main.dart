import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello world! :D")),
      body: const TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String textToWrite = "";

  @override
  void dispose() {
    super.dispose();
    // For refreshing the controller.
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Clear this, please") {
      controller.clear();
      text = "";
    }

    // This will force the class to refresh, allowing the text widget to be
    // shown.
    setState(() {
      textToWrite = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: controller,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.message_rounded),
              labelText: "Write a message here please:"),
          onChanged: (text) => changeText(text)),
      // Text widget that will show the text.
      Text(textToWrite)
    ]);
  }
}
