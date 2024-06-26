import 'package:dio/dio.dart';
import 'package:news_app/features/screens/home_page/data/server_data/api_helper.dart';

class ApiMethods extends ApiHelper{

  Future<dynamic> getData() async {
    try{
      final dio = createDio();
      final response = await dio.get('');
      return(response.data);

    }
    on DioException catch(e){
      print(e);
      return 'error';

    }



  }



}