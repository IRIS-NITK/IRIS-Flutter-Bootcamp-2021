import 'dart:io';

void main() {
  var account_login_credentials = {
    'mehul': 'dart@212',
    'harvey': 'imawsme234',
    'louis': 'harvey',
    'mike': '232242',
    'donna': 'imdona'
  };
  print("\t\t\tLOGIN PAGE");
  stdout.write("Username: ");
  var username = stdin.readLineSync();
  stdout.write("Password: ");
  var password = stdin.readLineSync();
  stdout.write("Please wait\t");
  for(var i = 0; i < 1; ++ i) {
    sleep(const Duration(seconds: 1));
    stdout.write(".");
    sleep(const Duration(seconds: 1));
    stdout.write(".");
    sleep(const Duration(seconds: 1));
    stdout.write(".");
    sleep(const Duration(milliseconds: 1000));
    stdout.write("\b\b\b");
  }
  stdout.write("\b\b\b\b\b\b\b\b\b\b\b\b");
  if(account_login_credentials[username] == password) {
    print("ACCESS GRANTED");
  }
  else {
    print("ACCESS DENIED!");
  }
}