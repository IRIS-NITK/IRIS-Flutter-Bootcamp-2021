import 'dart:io';

class Users {
  var users = [
    {'name': 'John', 'password': 'john@1'},
    {'name': 'Rob', 'password': 'rob@1'},
    {'name': 'Kate', 'password': 'Kate@1'},
    {'name': 'admin', 'password': 'admin@1'},
    {'name': 'Tohn', 'password': 'tohn@1'}
  ];

  void login() {
    print('Login');
    stdout.write('Username: ');
    String name = stdin.readLineSync();
    stdout.write('Password: ');

    String password = stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H");
    print('Signing In...');
    sleep(new Duration(seconds: 2));
    print("\x1B[2J\x1B[0;0H");
    users.forEach((element) {
      if (element['name'] == name && element['password'] == password) {
        print('$name Login Sucessful!! ');
      }
    });
  }
}

void main() {
  var obj = new Users();

  obj.login();
}
