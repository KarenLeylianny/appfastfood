import 'package:flutter/cupertino.dart';
import 'package:hola_mundo/models/user.dart';

class UserPrv with ChangeNotifier {
  User _user;
  List<User> _users = List<User>();

  User getUser(String email) {
    return this._users.firstWhere((element) => element.email == email,
        orElse: () {
      return null;
    });
  }

  get user {
    return _user;
  }

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  get users {
    return this._users;
  }

  set users(User user) {
    _users.add(user);
    notifyListeners();
  }
}
