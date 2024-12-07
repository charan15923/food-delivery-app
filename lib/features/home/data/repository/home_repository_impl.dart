import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/home_data_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../datasource/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.datasource);
  final HomeDatasource datasource;
  @override
  Future<Either<Failure, HomeDataEntity>> getHomeScreenData() async {
    try {
      final homeScreenData = await datasource.getHomeScreenData();
      return Right(homeScreenData);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
