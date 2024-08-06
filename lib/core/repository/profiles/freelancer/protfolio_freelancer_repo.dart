import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/get_token.dart';
import 'package:freelanc/features/freelancer/profile/data/portfolio_model.dart';

abstract class PortfolioFreelnacerRepo {
  DioConSumer api = DioConSumer();

  getPortfolio(int id);
  storePortfolio(
    String title,
    String? url,
    String description,
    String? date,
    List fileIds,
    List imagesIds,
    List? skillesIds,
    String section,
  );
  updatePorfolio(
    int id,
    String title,
    String? url,
    String description,
    String? date,
    List fileIds,
    List imageIds,
    List? skillesIds,
    String section,
  );

  deletPotrfolio(int id);
}

class PortfolioFreelancerRepoIm extends PortfolioFreelnacerRepo {
  @override
  Future<Either<String, dynamic>> deletPotrfolio(int id) async {
    try {
      final response = await api.delete(ApiEndPoint.deletePortfolio,
          header: {ApiKey.authorization: getToken()},
          data: {ApiKey.portfolioId: id});
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, PortfolioModel>> getPortfolio(int id) async {
    try {
      final response = await api.get("${ApiEndPoint.getPortfolio}/$id");
      return right(PortfolioModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, PortfolioModel>> storePortfolio(
    String title,
    String? url,
    String description,
    String? date,
    List fileIds,
    List? imagesIds,
    List? skillesIds,
    String section,
  ) async {
    try {
      String? token = await getToken();
      final response = await api.post(ApiEndPoint.storePortfolio, header: {
        ApiKey.authorization: token
      }, data: {
        ApiKey.title: title,
        ApiKey.url: url,
        ApiKey.date: date,
        ApiKey.description: description,
        ApiKey.fileIds: fileIds,
        ApiKey.imageIds: imagesIds,
        ApiKey.skillsId: skillesIds,
        ApiKey.section: section
      });
      return right(PortfolioModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> updatePorfolio(
    int id,
    String title,
    String? url,
    String description,
    String? date,
    List fileIds,
    List imageIds,
    List? skillesIds,
    String section,
  ) async {
    try {
      final response = await api.put(ApiEndPoint.updatePortfolio, header: {
        ApiKey.authorization: getToken()
      }, data: {
        ApiKey.id: id,
        ApiKey.title: title,
        ApiKey.url: url,
        ApiKey.date: date,
        ApiKey.description: description,
        ApiKey.fileIds: fileIds,
        ApiKey.imageIds: imageIds,
        ApiKey.skillsId: skillesIds,
        ApiKey.section: section
      });
      return right(PortfolioModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }
}
