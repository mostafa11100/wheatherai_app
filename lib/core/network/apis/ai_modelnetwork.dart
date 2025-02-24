import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:wheater_app/core/utilis/api_keys.dart';

abstract class AimodelNetworl {
  Future<GenerateContentResponse> createrequest(body);
}

class GemniApi extends AimodelNetworl {
  @override
  Future<GenerateContentResponse> createrequest(prompt) async {
    // Candidates? result = await Gemini.instance.prompt(
    //   parts: [Part.text(prompt)],
    // );
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apikeygemni,
      generationConfig: GenerationConfig(responseMimeType: 'application/json'),
    );

    final GenerateContentResponse response = await model.generateContent([
      Content.text(prompt),
    ]);

    return response;
  }
}
