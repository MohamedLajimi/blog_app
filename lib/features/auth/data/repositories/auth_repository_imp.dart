import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/core/enitites/user_entity.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      if (user == null) {
        return left(const Failure('User is not logged in'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailPassword(
      {required String email, required String password}) async {
    return await _getUser(() async => await remoteDataSource
        .signInWithEmailPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    return await _getUser(() async => await remoteDataSource
        .signUpWithEmailPassword(name: name, email: email, password: password));
  }

  Future<Either<Failure, UserEntity>> _getUser(
      Future<UserEntity> Function() function) async {
    try {
      final user = await function();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
