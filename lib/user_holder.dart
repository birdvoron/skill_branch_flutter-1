// import 'models/user.dart';
import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  User registerUserByEmail(String fullName, String email) {
    var user = User(name: fullName, email: email);
    if (users.containsKey(user.login))
      throw Exception("A user with this email already exists");
    users[user.login] = user;
    return user;
  }

  User registerUserByPhone(String fullName, String phone) {
    var user = User(name: fullName, phone: phone);
    if (users.containsKey(user.login))
      throw Exception("A user with this phone already exists");
    users[user.login] = user;
    return user;
  }

  bool addFriendToUser(String userFirstName, User friend) {
    if (users.containsKey(userFirstName)) {
      users[userFirstName].addFriend(friend);
      return true;
    }
    return false;
  }

  User findUserInFriends(String userFirstName, String usersFriend) {
    if (users.containsKey(userFirstName)) {
      for (var friend in users[userFirstName].getFriends) {
        if (friend.firstName == usersFriend) {
          return friend;
        }
      }
    }
    return null;
  }

  bool importUsers(List<User> newUsers) {
    if (newUsers.length == 0) return false;
    newUsers.forEach((element) {
      if (!users.containsKey(element.firstName))
        users[element.firstName] = element;
    });
    return true;
  }
}
