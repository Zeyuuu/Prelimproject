import '../models/user.dart';

class UserService {
  List<User> getUsers() {
    return [
      User('1', 'Alice'),
      User('2', 'Bob'),
      User('3', 'Yuki'),
      User('4', 'Meeo'),
      User('5', 'Zeu'),
    ];
  }
}
