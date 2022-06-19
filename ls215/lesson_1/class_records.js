function generateClassRecordSummary(scores) {
  let scoreData = Object.keys(scores).map(student => scores[student].scores);
  let examData = scoreData.map(score => score.exams);

  return {
    studentGrades: scoreData.map(scoreObj => getStudentScore(scoreObj)),
    exams: getExamSummary(examData),
  };
}

function getStudentScore(scoreObj) {
  const EXAM_WEIGHT = 0.65;
  const EXERCISES_WEIGHT = 0.35;
  const examScore = getAverageScore(scoreObj.exams) * EXAM_WEIGHT;
  const exercisesScore = getTotalScore(scoreObj.exercises) * EXERCISES_WEIGHT;
  const totalPercentGrade = examScore + exercisesScore;

  return `${totalPercentGrade.toFixed(0)} (${getLetterGrade(totalPercentGrade)})`;
}

function getAverageScore(scores) {
  return getTotalScore(scores) / scores.length;
}

function getTotalScore(scores) {
  return scores.reduce((sum, score) => sum + score);
}

function getLetterGrade(avgScore) {
  switch (true) {
    case avgScore >= 93:
      return 'A';
    case avgScore >= 85:
      return 'B';
    case avgScore >= 77:
      return 'C';
    case avgScore >= 69:
      return 'D';
    case avgScore >= 60:
      return 'E';
    default:
      return 'F';
  }
}

function getExamSummary(examData) {
  let examScores = getExamScores(examData);
  let examSummary = [];

  examScores.forEach(scores => {
    let resultObj = {
      average: getAverageScore(scores).toFixed(1),
      minimum: Math.min(...scores),
      maximum: Math.max(...scores),
    };

    examSummary.push(resultObj);
  });

  return examSummary;
}

function getExamScores(examData) {
  let examScores = [];

  for (let i = 0; i < examData.length; i += 1) {
    for (let j = 0; j < examData[j].length; j += 1) {
      examScores[j] = examScores[j] || [];
      examScores[j][i] = examData[i][j];
    }
  }

  return examScores;
}

let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));

