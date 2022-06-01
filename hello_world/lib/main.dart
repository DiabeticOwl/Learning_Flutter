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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  // changeText will change the state of the widget, modifying it's text.
  void changeText(String textForChanging) {
    setState(() {
      text = textForChanging;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello world! :D")),
      body: Column(children: <Widget>[
        TextInputWidget(
          // changeText is passed as an argument for our TextInputWidget.
          callback: changeText,
        ),
        Text(text)
      ]),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  // Here TextInputWidget is told that it needs to have this attribute.
  // Attribute being a function with a String parameter and called "callback".
  final Function(String) callback;

  // Here TextInputWidget is told that that callback is required at
  // instantiation.
  const TextInputWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // For refreshing the controller.
    controller.dispose();
  }

  // buttonPressed will access the attribute of the TextInputWidget called
  // "callback" and passes the text of "controller" to it. Then clears the
  // controller.
  void buttonPressed() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.message_rounded),
            suffixIcon: IconButton(
              // Function "buttonPressed" is passed as the "onPress" action.
              onPressed: buttonPressed,
              icon: const Icon(Icons.send),
              tooltip: "Show Message.",
              splashColor: Colors.red,
            ),
            labelText: "Write a message here please:"),
      ),
      // Text widget that will show the text.
    ]);
  }
}
