import 'dart:io';

class OpenElective {
  var courseCode;
  var courseName;

  OpenElective(code, name) {
    this.courseCode = code;
    this.courseName = name;
  }

  void printEl() {
    print('$courseCode  $courseName');
  }
}

class BranchElective {
  var courseCode;
  var courseName;
  var branch;
  var year;

  BranchElective(code, name, branch, year) {
    this.courseCode = code;
    this.courseName = name;
    this.branch = branch;
    this.year = year;
  }

  void printEl() {
    print('$courseCode  $courseName');
  }

  String branch_read() {
    return branch;
  }

  String year_read() {
    return year;
  }
}

void add_els(List OpenEls, List BranchEls) {
  print('##Add Electives##\n');
  print('Enter the type 1. Open \t 2. Branch');
  var choice = int.parse(stdin.readLineSync());

  if (choice == 1) {
    print('Enter Course Name and Code: ');
    // var name = stdin.readLineSync();
    // var code = stdin.readLineSync();
    // OpenEls.add(new OpenElective(code, name));
    var details = stdin.readLineSync().split(' ');
    OpenEls.add(new OpenElective(details[0], details[1]));
  } else {
    print('Enter Course Name, Code, branch, year: ');
    var details = stdin.readLineSync().split(' ');
    BranchEls.add(
        new BranchElective(details[0], details[1], details[2], details[3]));
  }
}

void view_els(List OpenEls, List BranchEls, branch, year) {
  print('View Electives');
  print('##Open Electives##\n');

  OpenEls.forEach((element) {
    element.printEl();
  });

  print('\n##Branch Electives##\n');
  BranchEls.forEach((element) {
    if (element.branch_read() == branch && element.year_read() == year) {
      element.printEl();
    }
  });

  var c = stdin.readLineSync();
}

void main() {
  var OpenEls = new List();
  OpenEls.add(new OpenElective('ma101', 'maths1'));
  OpenEls.add(new OpenElective('cs202', 'comp1'));
  List BranchEls = new List();
  BranchEls.add(new BranchElective('ec340', 'COA', 'ec', '2'));
  BranchEls.add(new BranchElective('ec344', 'AIC', "ec", '2'));

  var isAdmin;
  while (true) {
    print('\x1B[2J\x1B[0;0H');
    print('Enter the user type 1. Admin 2. Student');
    isAdmin = int.parse(stdin.readLineSync());

    if (isAdmin == 1) {
      add_els(OpenEls, BranchEls);
    } else {
      print('Enter branch and year');
      var details = stdin.readLineSync().split(' ');
      // print('$details');
      view_els(OpenEls, BranchEls, details[0], details[1]);
    }
  }
}
