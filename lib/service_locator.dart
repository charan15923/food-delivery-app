import 'package:get_it/get_it.dart';

import 'core/router/app_navigation.dart';
import 'features/home/data/datasource/home_datasource.dart';
import 'features/home/data/repository/home_repository_impl.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/domain/usecases/get_home_screen_data_usecase.dart';
import 'features/home/presentation/bloc/cart/cart_bloc.dart';
import 'features/home/presentation/bloc/home/home_bloc.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl
    ..registerLazySingleton(() => AppNavigation.router)
    ..registerFactory(CartBloc.new);
  _initHomeScreenDependencies();
}

void _initHomeScreenDependencies() {
  // Datasource
  sl
    ..registerFactory<HomeDatasource>(
      HomeDatasourceImpl.new,
    )
    // Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        sl(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetHomeScreenDataUseCase(
        sl(),
      ),
    )

    // Bloc
    ..registerFactory(
      () => HomeBloc(
        sl(),
      ),
    );
}
