import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/uploadimagetoApi.dart';
import 'package:freelanc/core/model/image_model.dart';

abstract class ShardApiFuntions {
  DioConSumer api = DioConSumer();

  // functions
  uploadImage(File image);
}

class SharedApiFunctionIm extends ShardApiFuntions {
  @override
  Future<Either<String, ImageModle>> uploadImage(File image) async {
    try {
      final response = await api.post(ApiEndPoint.storageimage,
          isFomrData: true, data: {'image': await uploadImgetoApi(image)});

      return right(ImageModle.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }
}
