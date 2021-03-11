import 'package:flutter/material.dart';
import 'package:flutter_api_provider/model/sample_model.dart';
import 'package:flutter_api_provider/provider/api_provider.dart';

class SampleProvider with ChangeNotifier {
  APIResponseModel data = APIResponseModel();
  SampleAPI getapi = SampleAPI();
  //Sample sample;
  SampleModel sampleModel;

  SampleModel get sampleModelGetter => sampleModel;

  getData() async {
    data = await getapi.getDataFromAPI();
    //data = await getapi.postDataToAPI(1, 100, 'Title provider', 'Body Provider');
    //if(data.statusCode == 200 || data.statusCode == 201){
      //sample  = data.response;
      sampleModel = data.response;
   // }
    notifyListeners();
  }
}
