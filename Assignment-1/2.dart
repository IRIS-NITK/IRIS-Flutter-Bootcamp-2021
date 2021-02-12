import 'dart:io';

class BranchElective {
  String courseName;
  String courseCode;
  String branch;
  int year;

  BranchElective(this.courseName, this.courseCode, this.branch, this.year);
}

class OpenElective {
  String courseName;
  String courseCode;

  OpenElective(this.courseName, this.courseCode);
}

void printlist1(var list) {
  int n = list.length;
  for (int i = 0; i < n; i++) {
    print("${list[i].courseName} ${list[i].courseCode} ");
  }
  print('');
}

printlist2(var list, int year) {
  int n = list.length;
  for (int i = 0; i < n; i++) {
    if (list[i].year == year) {
      print("${list[i].courseName} ${list[i].courseCode}");
    }
  }
}

int main() {
  OpenElective oe1 = new OpenElective('open elective 1', 'oe1');
  OpenElective oe2 = new OpenElective('open elective 2', 'oe2');
  OpenElective oe3 = new OpenElective('open elective 3', 'oe3');
  OpenElective oe4 = new OpenElective('open elective 4', 'oe4');
  List openelectives = [oe1, oe2, oe3, oe4];
  BranchElective cs11 =
      new BranchElective("cs branch elective 1", "cs11", "cs", 1);
  BranchElective cs21 =
      new BranchElective("cs branch elective 2", "cs21", "cs", 2);
  BranchElective cs31 =
      new BranchElective("cs branch elective 3", "cs31", "cs", 3);
  BranchElective cs41 =
      new BranchElective("cs branch elective 4", "cs41", "cs", 4);

  BranchElective ec11 =
      new BranchElective("ec branch elective 1", "ec11", "ec", 1);
  BranchElective ec21 =
      new BranchElective("ec branch elective 2", "ec21", "ec", 2);
  BranchElective ec31 =
      new BranchElective("ec branch elective 3", "ec31", "ec", 3);
  BranchElective ec41 =
      new BranchElective("ec branch elective 4", "ec41", "ec", 4);

  BranchElective cs12 =
      new BranchElective("cs branch elective 1", "cs12", "cs", 1);
  BranchElective cs22 =
      new BranchElective("cs branch elective 2", "cs22", "cs", 2);
  BranchElective cs32 =
      new BranchElective("cs branch elective 3", "cs32", "cs", 3);
  BranchElective cs42 =
      new BranchElective("cs branch elective 4", "cs42", "cs", 4);

  BranchElective ec12 =
      new BranchElective("ec branch elective 1", "ec12", "ec", 1);
  BranchElective ec22 =
      new BranchElective("ec branch elective 2", "ec22", "ec", 2);
  BranchElective ec32 =
      new BranchElective("ec branch elective 3", "ec32", "ec", 3);
  BranchElective ec42 =
      new BranchElective("ec branch elective 4", "ec42", "ec", 4);

  List cscourses = [cs11, cs21, cs31, cs41, cs12, cs22, cs32, cs42];
  List eccourses = [ec11, ec21, ec31, ec41, ec12, ec22, ec32, ec42];

  var branchelectives = {"cs": cscourses, "ec": eccourses};
  while (true) {
    print("Enter 1 for admin || 2 for student || 3 to quit: ");
    String first_input = stdin.readLineSync();
    if (first_input == "1") {
      print(
          "Enter 1 to add a new branch elective, 2 to add a new open elective");
      String second_input = stdin.readLineSync();
      if (second_input == "2") {
        print("Enter course name: ");
        String course_name = stdin.readLineSync();
        print("Enter course code: ");
        String course_code = stdin.readLineSync();
        OpenElective inputed_course =
            new OpenElective(course_name, course_code);
        openelectives.add(inputed_course);
      }
      if (second_input == "1") {
        print("Enter course name: ");
        String course_name = stdin.readLineSync();
        print("Enter course code: ");
        String course_code = stdin.readLineSync();
        print("Enter branch (cs/ec): ");
        String course_branch = stdin.readLineSync();
        print("Enter course year: ");
        String course_year = stdin.readLineSync();
        BranchElective inputed_course = new BranchElective(
            course_name, course_code, course_branch, int.parse(course_year));
        branchelectives[course_branch].add(inputed_course);
      }
    }
    if (first_input == "2") {
      print("Enter your branch(cs/ec): ");
      String branch = stdin.readLineSync();
      print("Enter your year: ");
      int year = int.parse(stdin.readLineSync());
      print("Open Electives: ");
      printlist1(openelectives);
      print("Branch Electives: ");
      printlist2(branchelectives[branch], year);
    }
    if (first_input == "3") {
      return 0;
    }
  }
}
