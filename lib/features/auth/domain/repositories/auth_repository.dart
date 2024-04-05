import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/enitites/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword(
      {required String name, required String email, required String password});
  Future<Either<Failure, UserEntity>> signInWithEmailPassword(
      {required String email, required String password});
  Future<Either<Failure, UserEntity>> getCurrentUser();
}
