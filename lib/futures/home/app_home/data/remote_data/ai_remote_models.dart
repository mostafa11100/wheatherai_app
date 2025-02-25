import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:wheater_app/core/network/apis/ai_modelnetwork.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';

abstract class BaseRemoteModels<Tresponse> {
  Future<Tresponse>? createrequest({required GetCurrentEntity entity});
}

class GemniAiModelRemote extends BaseRemoteModels<GenerateContentResponse> {
  AimodelNetworl aimodel;
  GemniAiModelRemote(this.aimodel);
  @override
  createrequest({GetCurrentEntity? entity}) async {
    GenerateContentResponse result = await aimodel.createrequest(
      createprompt(entity),
    );
    return result;
  }
}

String createprompt(entity) {
  return '''
Analyze the following weather conditions and determine if it is suitable to go outside.  
Respond only in JSON format with a single boolean field "go_outside".  
Return **true** if the weather is good for going out, or **false** if it is not.


Temperature: ${entity!.temperature}  
Condition: ${entity.conditionText}
Wind Speed: ${entity.windSpeed} km/h  
Humidity: ${entity.humidity}%  
Cloudiness: ${entity.cloudiness}%  
Visibility: ${entity.visibility}km  
Last Updated: ${entity.lastUpdated}  
''';
}
