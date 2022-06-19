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

let foo = createStudent('Foo', '1st');
console.log(foo.info());

console.log(foo.listCourses());

foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
console.log(foo.listCourses());

foo.addNote(101, 'Fun Course');
foo.addNote(101, 'Remember to study for algebra');
console.log(foo.viewNotes());

foo.addNote(102, 'Difficult Subject');
console.log(foo.viewNotes());

foo.updateNote(101, 'Fun course');
console.log(foo.viewNotes());
