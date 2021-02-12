import 'dart:io';

class OpenElective {
  String courseCode;
  String courseName;
  void display() {
    print('$courseCode,$courseName');
  }
}

class BranchElective {
  String courseCode;
  String courseName;
  String branch;
  int year;
  void display() {
    print('$courseCode,$courseName');
  }

  String get branchname {
    return branch;
  }

  int get yearofstudy {
    return year;
  }
}

void main() {
  var OElectives = [];
  var BElectives = [];
  while (true) {
    print("Enter the type of user \n");
    print("1. Admin\n");
    print("2. Student\n");
    print("3. Exit\n");
    var user = int.parse(stdin.readLineSync());
    if (user == 1) {
      print("Enter Course type\n");
      print("1.Branch Electives\n");
      print("2.Open Electives\n");
      var ch = int.parse(stdin.readLineSync());
      if (ch == 1) {
        var object = new BranchElective();
        print('Enter Course Code\n');
        object.courseCode = stdin.readLineSync();
        print('Enter Course Name\n');
        object.courseName = stdin.readLineSync();
        print('Enter Branch\n');
        object.branch = stdin.readLineSync();
        print('Enter Year\n');
        object.year = int.parse(stdin.readLineSync());
        BElectives.add(object);
      } else if (ch == 2) {
        var object = new OpenElective();
        print('Enter Course Code\n');
        object.courseCode = stdin.readLineSync();
        print('Enter Course Name\n');
        object.courseName = stdin.readLineSync();
        OElectives.add(object);
      }
    } else if (user == 2) {
      print('Enter Year of Study\n');
      var year = int.parse(stdin.readLineSync());
      print('Enter Branch name\n');
      var bname = stdin.readLineSync();
      print('Branch Electives:\n');
      for (var i = 0; i < BElectives.length; i++) {
        if (BElectives[i].branchname == bname &&
            BElectives[i].yearofstudy == year) BElectives[i].display();
      }
      print('\n');
      print('Open Electives:\n');
      for (var i = 0; i < OElectives.length; i++) {
        OElectives[i].display();
      }
    } else {
      break;
    }
  }
}
