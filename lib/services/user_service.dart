import 'package:get_it/get_it.dart';
import 'package:pentrar/models/user.dart';

class UserService {
  final User user;

  UserService(this.user);

  static final GetIt _getIt = GetIt.instance;

  static void setup(User user) {
    _getIt.registerSingleton<UserService>(UserService(user));
  }

  static UserService get instance => _getIt<UserService>();

  User get currentUser => user;
}
