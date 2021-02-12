import 'dart:io';

class account {
  String username;
  String password;
  account(username, password) {
    this.username = username;
    this.password = password;
  }
}

int main() {
  account ac1 = new account('ragul', 'ragul@123');
  account ac2 = new account('ramesh', 'ramesh@123');
  account ac3 = new account('rakesh', 'rakesh@123');
  account ac4 = new account('rithvik', 'rithvik@123');
  account ac5 = new account('riya', 'riya@123');

  //Accounts list
  List<account> accounts = [ac1, ac2, ac3, ac4, ac5];

  //Inputs
  print('Enter your username: ');
  String username = stdin.readLineSync();
  print('Enter your password: ');
  String password = stdin.readLineSync();

  //checking if user exists
  for (int i = 0; i < 5; i++) {
    if (username == accounts[i].username) {
      if (password == accounts[i].password) {
        for (int i = 0; i < 5; i++) {
          sleep(Duration(seconds: 1));
          stdout.write('. ');
        }
        print('');
        print("Your are sucessfully logged in!!");
        return 0;
      } else {
        for (int i = 0; i < 5; i++) {
          sleep(Duration(seconds: 1));
          stdout.write('. ');
        }
        print('');
        print("Password entered is incorrect!!");
        return 0;
      }
    }
  }
  for (int i = 0; i < 5; i++) {
    sleep(Duration(seconds: 1));
    stdout.write('. ');
  }
  print('');
  print("Username doesnot exist!!");
  return 0;
}
