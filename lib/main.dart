import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web View Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        //todo change your url
        Uri.parse('https://flutter.dev'),
      );
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        if(await controller.canGoBack()){
          controller.goBack();
          return false;
        }
        else{
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(

          title: const Text("Web view Demo"),

        ),
        body:   WebViewWidget(
          controller: controller,

        )
      ),
    );
  }
}
