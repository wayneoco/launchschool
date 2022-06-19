function getGrade(...grades) {
  const gradesTotal = grades.reduce((sum, num) => sum + num);
  const gradesAvg = gradesTotal / grades.length;
  let grade;

  switch (true) {
    case gradesAvg >= 90:
      grade = 'A';
      break;
    case gradesAvg >= 80:
      grade = 'B';
      break;
    case gradesAvg >= 70:
      grade = 'C';
      break;
    case gradesAvg >= 60:
      grade = 'D';
      break;
    default:
      grade = 'F';
      break;
  }

  return console.log(grade);
}

getGrade(95, 90, 93);    // "A"
getGrade(50, 50, 95);    // "D"
