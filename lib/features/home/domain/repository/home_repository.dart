import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_data_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, HomeDataEntity>> getHomeScreenData();
}
