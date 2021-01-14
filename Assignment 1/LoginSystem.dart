import 'dart:io';
void main() {
  var details = new Map();
  var usernames = ['Nityesh', 'Pankaj', 'Andrew', 'Ambika'];
  var passwords = ['286', 'p786', 'A777', 'am8383'];
  for (var i = 0; i < usernames.length; i++) {
    details[usernames[i]] = passwords[i];
  }
  print("Enter Username: ");
  var us = stdin.readLineSync();
  print("Enter Password: ");
  var pass = stdin.readLineSync();
  if (details[us] == pass) {
    print("Login Successful");
  } else {
    print("Login Failed.Invalid Username and Password");
  }
}
