import 'package:flutter/material.dart';
import 'package:flutter_api_provider/provider/sample_provider.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<SampleProvider>(context,);

    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("Provider API")),
      ),

      body: Consumer<SampleProvider>(
          builder: (context, provider,child) {
            //Center(child: Text("Press the button"),);
            return ListView.builder(
                itemCount: provider.sampleModelGetter.listOfSample.length,
                itemBuilder: (context, int index) {
                   return Column(
                    children: [
                     Text(provider.sampleModelGetter.listOfSample[index].userId.toString()),
                      child,
                      Text(provider.sampleModelGetter.listOfSample[index].title),
                     //),
                      Divider(),
                    ],

                  );
                });
          },
       child: Container(),),

      // body: Consumer<SampleProvider>(
      //     builder: (context, provider,_) {
      //             return Column(
      //               children: [
      //                 Text(provider.sample == null ? 'Test userid' : provider.sample.userId.toString()),
      //                 Text(provider.sample == null ? 'Test id' : provider.sample.id.toString()),
      //                 Text(provider.sample == null ? 'Test title' : provider.sample.title ),
      //                 Text(provider.sample == null ? 'Test Body' : provider.sample.body ),
      //                 Divider(),
      //               ],
      //             );
      //           //});
      //     }),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await provider.getData();
        },
        child: Icon(Icons.download_rounded),
      ),

    );
    }
}
