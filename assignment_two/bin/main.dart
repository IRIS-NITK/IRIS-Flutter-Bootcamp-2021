import 'dart:io';

class elective {
  var course_name = 'Not Assigned';
  var course_code = 'Not Assigned';
  view() {
    stdout.write("\tName: $course_name");
    stdout.write("\n\tCode: $course_code\n\n");
  }
  elective(var val_0, var val_1) {
    course_name = val_0;
    course_code = val_1;
  }
}

class open_elective extends elective {
  open_elective(var val_0, var val_1): super(val_0, val_1) {
  }
}

class branch_elective extends elective {
  var course_branch = 'Not Assigned';
  var course_year = 'Not Assigned';
  branch_elective(var val_0, var val_1, var val_2, var val_3): super(val_0, val_1) {
    course_branch = val_2;
    course_year =val_3;
  }
}

int main() {
  var choice;
  List list_open_electives = [];
  List list_branch_electives = [];
  list_open_electives.add(new open_elective('Business Management', 'BM101'));
  list_branch_electives.add(new branch_elective('AI', 'AI110', 'CSE', '3'));
  bool alive = true;
  while(alive) {
    print("\t\t\t\tCOURSE MODULE\n");
    stdout.write("Enter type of user\n\t1 for admin\n\t2 for student\n->");
    choice = stdin.readLineSync();
    if (choice == '1') {
      stdout.write("Enter type of the new course\n\t1 for branch elective\n\t2 for open elective\n->");
      choice = stdin.readLineSync();
      if(choice == '1') {
        print("Enter the following details about the new branch elective course");
        stdout.write("\tName: ");
        var name = stdin.readLineSync();
        stdout.write("\tCode: ");
        var code = stdin.readLineSync();
        stdout.write("\tBranch: ");
        var branch = stdin.readLineSync();
        stdout.write("\tYear: ");
        var year = stdin.readLineSync();
        list_branch_electives.add(new branch_elective(name, code, branch, year));
        print("New branch elective course successfully created!");
      }
      else if(choice == '2') {
        print("Enter the following details about the new open elective course");
        stdout.write("\tName: ");
        var name = stdin.readLineSync();
        stdout.write("\tCode: ");
        var code = stdin.readLineSync();
        list_open_electives.add(new open_elective(name, code));
        print("New open elective course successfully created!");
      }
      else {
        print("INVALID INPUT!");
      }
    }
    else if (choice == '2') {
      print("Enter the following");
      stdout.write("\tBranch: ");
      var branch = stdin.readLineSync();
      stdout.write("\tYear: ");
      var year = stdin.readLineSync();
      print("\nOPEN ELECTIVES:");
      for(var i = 0; i < list_open_electives.length; ++ i) {
        list_open_electives[i].view();
      }
      print("BRANCH ELECTIVES:");
      for(var i = 0; i < list_branch_electives.length; ++ i) {
        if((list_branch_electives[i].course_branch == branch) && (list_branch_electives[i].course_year == year)) {
          list_branch_electives[i].view();
        }
      }
    }
    else {
      print("INVALID INPUT!");
    }
    stdout.write("Do you want to continue?[y/n]: ");
    choice = stdin.readLineSync();
    if(choice != 'y') {
      alive = false;
    }
    else {
      print("\x1B[2J\x1B[0;0H");
    }
  }
  return 0;
}
