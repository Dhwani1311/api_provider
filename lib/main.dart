import 'package:flutter/material.dart';
import 'package:flutter_api_provider/provider/sample_provider.dart';
import 'package:flutter_api_provider/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<SampleProvider>(create: (_) => SampleProvider(),),

      ], child:MyHomePage() ,),
    );
  }

}
