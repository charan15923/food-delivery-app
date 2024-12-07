import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/home_data_entity.dart';
import '../repository/home_repository.dart';

class GetHomeScreenDataUseCase extends UseCase<HomeDataEntity, NoParams> {
  GetHomeScreenDataUseCase(this.repository);
  final HomeRepository repository;
  @override
  Future<Either<Failure, HomeDataEntity>> call(NoParams params) async {
    return await repository.getHomeScreenData();
  }
}
