/* eslint-disable */

function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],
    info() {
      console.log(`${this.name} is a ${this.year} year student.`);
    },
    addCourse(course) {
      this.courses.push(course);
    },
    listCourses() {
      return this.courses;
    },
    addNote(courseCode, note) {
      const course = this.courses.filter(({code}) => code === courseCode)[0];

      if (course) {
        if (course.note) {
          course.note.push(note);
        } else {
          course.note = [];
          course.note.push(note);
        }
      }
    },
    viewNotes() {
      this.courses.forEach(course => {

        if (course.note) {
          console.log(`${course.name}: ${course.note.join('; ')}`)
        }
      })
    },
    updateNote(courseCode, note) {
      const course = this.courses.filter(({code}) => code === courseCode)[0];

      course.note = [note];
    },
  };
}

function createSchool() {
  return {
    students: [],
    addStudent(name, year) {
      const validYears = ['1st', '2nd', '3rd', '4th', '5th'];

      if (validYears.includes(year)) {
        const student = createStudent(name, year);
        this.students.push(student);
        return student;
      } else {
        console.log('Invalid Year');
      }
    },
    enrollStudent(student, course) {
      student.addCourse(course);
    },
    addGrade(student, courseCode, grade) {
      const course = student.listCourses().filter(({code}) => code === courseCode)[0];

      if (course) {
        course.grade = grade;
      }
    },
    getReportCard(student) {
      student.listCourses().forEach(({ name, grade }) => {
        if (grade) {
          console.log(`${name}: ${grade}`);
        } else {
          console.log(`${name}: In progress`);
        }
      });
    },
    courseReport(courseName) {
      let grades = [];

      this.students.forEach(({name, courses}) => {
        const course = courses.filter(({name}) => name === courseName)[0];

        if (course) {
          if (course.grade) {
            grades.push({ student: name, grade: course.grade });
          }
        }
      });

      if (grades.length > 0) {
        console.log(`=${courseName}=`);
        let average = grades.reduce((sum, {student, grade}) => {
          console.log(`${student}: ${grade}`);
          return sum + grade;
        }, 0) / grades.length;
        console.log('---');
        console.log(`Course Average: ${average}\n`);
      }
    },
  }
}

let school = createSchool();
let foo = school.addStudent('Foo', '3rd');
let bar = school.addStudent('Bar', '1st');
let qux = school.addStudent('Qux', '2nd');

school.enrollStudent(foo, { name: 'Math', code: 101 });
school.enrollStudent(foo, { name: 'Advanced Math', code: 102 });
school.enrollStudent(foo, { name: 'Physics', code: 202 });
school.enrollStudent(bar, { name: 'Math', code: 101 });
school.enrollStudent(qux, { name: 'Math', code: 101 });
school.enrollStudent(qux, { name: 'Advanced Math', code: 102 });

school.addGrade(foo, 101, 95);
school.addGrade(foo, 102, 90);
school.addGrade(bar, 101, 91);
school.addGrade(qux, 101, 93);
school.addGrade(qux, 102, 90);

console.log(school.getReportCard(foo));
console.log(school.getReportCard(bar));
console.log(school.getReportCard(qux));

school.courseReport('Math');
school.courseReport('Advanced Math');
school.courseReport('Physics');
