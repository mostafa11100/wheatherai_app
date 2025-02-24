import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/home/app_home/data/remote_data/ai_remote_models.dart';
import 'package:wheater_app/futures/home/app_home/domain/entitys/getcurrent_entity.dart';
import 'package:wheater_app/futures/home/app_home/domain/interfaces/aimodel_interface.dart';

class GemniAiRepo extends BaseAiModelRepo<GetCurrentEntity> {
  final BaseRemoteModels _remoteModels;
  GemniAiRepo(this._remoteModels);
  @override
  Future<Either<Failure, GetCurrentEntity>>? create({
    GetCurrentEntity? entity,
  }) async {
    try {
      GenerateContentResponse? result = await _remoteModels.createrequest(
        entity: entity!,
      );

      entity.goout = jsonDecode(result!.text!)['go_outside'];

      return Right(entity);
    } on GeminiException catch (e) {
      return Left(Failure.handleGeminiError(e.statusCode!));
    } catch (e) {
      return Left(Failure.fromjson(e.toString()));
    }
  }
}
